SUBROUTINE DR_HOOK_UTIL(LDHOOK,CDNAME,KCASE,PKEY,CDFILENAME,KSIZEINFO)
USE PARKIND1  ,ONLY : JPIM     ,JPRB    ,JPRD
USE OML_MOD,ONLY : OML_MAX_THREADS,OML_MY_THREAD,OML_INIT
USE MPL_INIT_MOD, ONLY : MPL_INIT
USE MPL_ARG_MOD, ONLY : MPL_GETARG
USE YOMGSTATS, ONLY : LAST_KNUM,LAST_KSWITCH,LDETAILED_STATS,MYPROC_STATS, &
                      NHOOK_MESSAGES,TIME_LAST_CALL
USE YOMHOOKSTACK, ONLY : LL_THREAD_FIRST,ISAVE,IMAXSTACK,CSTACK   ! For monitoring thread stack usage
!<DrHack> 
USE MPL_MYRANK_MOD,ONLY : MPL_MYRANK ! useful for DrHack
USE YOMLUN_IFSAUX, ONLY : NULDRHACK
USE NVTX
!</DrHack>

IMPLICIT NONE
LOGICAL,INTENT(INOUT)       :: LDHOOK
CHARACTER(LEN=*),INTENT(IN) :: CDNAME,CDFILENAME
INTEGER(KIND=JPIM),INTENT(IN) :: KCASE,KSIZEINFO
REAL(KIND=JPRB),INTENT(INOUT) :: PKEY
#ifdef RS6K
INTEGER(KIND=JPIM) :: INEWMASK, IOLDMASK, UMASK
#endif
#ifdef CRAYXT
INTEGER(KIND=JPIM) :: IRET, SETVBUF3F
#endif
LOGICAL,SAVE :: LL_FIRST_TIME = .TRUE.
CHARACTER(LEN=512) :: CLENV
INTEGER(KIND=JPIM) INUMTIDS, IMYTID
LOGICAL :: LLMPI
INTEGER*8 :: MAXMEM=0
INTEGER*8 :: GETMAXMEM
INTEGER*8 GETMAXLOC
LOGICAL :: LLFINDSUMB=.FALSE.
REAL(KIND=JPRD) :: ZCLOCK
REAL(KIND=JPRB) :: ZDIFF
CHARACTER(LEN=7) CLSTR

INTEGER*8 ILOC         ! For monitoring thread stack usage
CHARACTER(LEN=3) CHEAP ! For monitoring heap usage
INTEGER          JHEAP ! For monitoring heap usage
DATA JHEAP/0/

!useful variable for DrHack
LOGICAL,SAVE :: LL_DRHACK=.FALSE. !set to .TRUE. if MPIRANK=0 and Env variable DR_HACK=1
INTEGER,SAVE :: II_DRNVTX = 0     ! 0=no initialized, -1=nvtx off, +1=nvtx on

#include "user_clock.h"

!
! Florian Suzat (METEO-FRANCE) Sept 2017 : add drHack functionality
!
! drHack documentation:
! ----------------------------------
! ARPIFS has become a huge and complicated program. Debugging it can be very
! painful especially for newbies. Documenting it is also is a huge and tedious
! job.
! The idea behind “drHack” is basically to hack drHook: using the calls 
! "IF (LHOOK) CALL DR_HOOK('XXX',I,ZHOOK_HANDLE)" 
! (where XXX is the name of a routine, and I is 0 at the beginning of the
! routine and 1 at
! the end) in order to build a big XML file describing the ARPIFS calling tree.
! At initialization, if both environmental variables DR_HOOK and DR_HACK are set
! equal to 1, 
! then the hack is activated, otherwise everything works as usual.

! IMPORTANT: for the moment, it does not work with openmp
! (need to run with openmp=1) 

! When active, we first open a file drhack.txt.
! Every time the program enters a routine, we append <ROUTINE_NAME> to the
! file, and every time the routine is left, we append </ROUTINE_NAME> (mind the
! “/” extra character).
! Then, at the end of the run, the (big!) file drhack.txt contains the calling
! tree of the MPI processor number 0 as an XML file:
! <MASTER>
! <STACK_MIX_INIT_STACK>
! <STACK_MIX_GETSTACKUSAGEX>
! </STACK_MIX_GETSTACKUSAGEX>
! </STACK_MIX_INIT_STACK>
! <CNT0>
! <GEOMETRY_MOD_GEOMETRY_SET>
! </GEOMETRY_MOD_GEOMETRY_SET>
! ....
! 
! The resulting files are not usable as is (because they are too big). But with
! a few
! lines of python, it is easy to produce a condensed version of the drhack.txt
! file
! (if you want an example script, you may ask florian.suzat@meteo.fr).
! Then, with html and javascript, these condensed files are read and a
! dynamic collapsible search tree is built.
! Illustrations of such pages can be seen at http://intra.cnrm.meteo.fr/drhack/ 
! (only from the MeteoFrance network... If you want an export, mail
! florian.suzat@meteo.fr)

! Hope this help...

IF (II_DRNVTX == 0) THEN
BLOCK
  CHARACTER*32 :: CL_NVTX
  CALL GETENV ('DR_NVTX', CL_NVTX)
  IF (CL_NVTX == '1') THEN
    II_DRNVTX = +1
  ELSE
    II_DRNVTX = -1
  ENDIF
ENDBLOCK
ENDIF

IF (II_DRNVTX == 1) THEN
  IF (KCASE == 0) THEN
    CALL NVTXSTARTRANGE(CDNAME)
  ELSEIF (KCASE==1) THEN
    CALL NVTXENDRANGE
  ENDIF
  RETURN
ENDIF


! -----------------------------------------------------------------

IF (.NOT.LDHOOK) RETURN

IMYTID = OML_MY_THREAD()
INUMTIDS = OML_MAX_THREADS()
IF (LL_FIRST_TIME) THEN
  LL_FIRST_TIME = .FALSE.
#ifdef CRAYXT
  IRET = SETVBUF3F(0, 1, 0) ! Set unit#0 into line-buffering mode to avoid messy output
#endif
  CALL OML_INIT()
  CALL GET_ENVIRONMENT_VARIABLE('DR_HOOK_NOT_MPI',CLENV)
  IF (CLENV == ' ' .OR. CLENV == '0' .OR. &
    & CLENV == 'false' .OR. CLENV == 'FALSE') THEN
    LLMPI=.TRUE.
    CALL MPL_INIT(LDINFO=.FALSE.) ! Do not produce any output
  ELSE
    LLMPI=.FALSE.
  ENDIF
  CALL GET_ENVIRONMENT_VARIABLE('DR_HOOK',CLENV)
  IF (CLENV == ' ' .OR. CLENV == '0' .OR. &
    & CLENV == 'false' .OR. CLENV == 'FALSE') THEN
    LDHOOK = .FALSE.
    CALL C_DRHOOK_SET_LHOOK(0)
  ENDIF
  IF (LLMPI) THEN
    CALL MPL_GETARG(0, CLENV)  ! Get executable name & also propagate args
  ELSE
    CALL GET_COMMAND_ARGUMENT(0, CLENV)
  ENDIF
  IF (.NOT.LDHOOK) RETURN
  
  CALL C_DRHOOK_INIT(CLENV, INUMTIDS)

!JFH---Initialisation to monitor stack usage by threads-------------
  CALL GET_ENVIRONMENT_VARIABLE('DR_HOOK_STACKCHECK',CSTACK)
  IF (CSTACK == 'yes' .OR. CSTACK == 'YES' ) THEN
    IF(IMYTID == 1 ) THEN
      ALLOCATE(LL_THREAD_FIRST(INUMTIDS))
      ALLOCATE(ISAVE(INUMTIDS))
      ALLOCATE(IMAXSTACK(INUMTIDS))
      LL_THREAD_FIRST=.TRUE.
      ISAVE=0
      IMAXSTACK=0
    ENDIF
  ENDIF
!JFH------------ End ---------------------------------------------
!JFH---Initialisation to monitor heap usage-----------------------
  JHEAP=0
  CALL GET_ENVIRONMENT_VARIABLE('DR_HOOK_HEAPCHECK',CHEAP)
  IF (CHEAP == 'yes' .OR. CHEAP == 'YES' ) JHEAP=1
  IF (CHEAP == 'trb' .OR. CHEAP == 'TRB' ) JHEAP=2
  IF(IMYTID == 1) THEN
    IF(JHEAP>0) THEN
!     write(0,*) "HEAPCHECK=",CHEAP,JHEAP
      CALL SETHEAPCHECK()
    ENDIF
  ENDIF
!JFH------------ End ---------------------------------------------

 !DrHack initialisation
 CALL GET_ENVIRONMENT_VARIABLE('DR_HACK',CLENV)
 IF ((CLENV == '1') .and. ( MPL_MYRANK() ==1 )) THEN
   LL_DRHACK=.TRUE.  
   OPEN (UNIT = NULDRHACK, file = "drhack.txt",position="append",action="write")
 ENDIF

ENDIF

!JFH---Code to monitor stack usage by threads---------------------
#ifndef NAG
IF (CSTACK == 'yes' .or. CSTACK == 'YES' ) THEN
  IF(IMYTID > 1) THEN
    IF(LL_THREAD_FIRST(IMYTID))THEN 
      LL_THREAD_FIRST(IMYTID)=.FALSE.
      ISAVE(IMYTID)=LOC(LLMPI)
    ENDIF
    ILOC=LOC(LLMPI)
    IF(ISAVE(IMYTID)-ILOC > IMAXSTACK(IMYTID)) THEN
      IMAXSTACK(IMYTID)=ISAVE(IMYTID)-ILOC
      WRITE(0,'(A,I3,A,I12,2X,A)')"STACKCHECK Max stack usage by thread",imytid," =",IMAXSTACK(IMYTID),CDNAME
    ENDIF
  ENDIF
ENDIF
#endif
!JFH------------ End ---------------------------------------------

IF (KCASE == 0) THEN
  CALL C_DRHOOK_START(CDNAME, IMYTID, PKEY, CDFILENAME, KSIZEINFO)
!JFH---Code to monitor heap usage -------------------------
  IF(IMYTID == 1 .AND. MYPROC_STATS == 1 .AND. JHEAP>0) THEN
    GETMAXMEM=GETMAXLOC()
    IF(GETMAXMEM .GT. MAXMEM) THEN
      MAXMEM = GETMAXMEM
      WRITE(0,*) "HEAPCHECK Max heap at beg of routine =",MAXMEM," ",CDNAME
#ifdef RS6K
      IF(JHEAP == 2) CALL XL__TRBK()
#endif
    ENDIF
  ENDIF
!JFH------------ End ---------------------------------------------
ELSE IF (KCASE == 1) THEN
!JFH---Code to monitor heap usage -------------------------
  IF(IMYTID == 1 .AND. MYPROC_STATS == 1 .AND. JHEAP>0) THEN
    GETMAXMEM=GETMAXLOC()
    IF(GETMAXMEM .GT. MAXMEM) THEN
      MAXMEM = GETMAXMEM
      WRITE(0,*) "HEAPCHECK Max heap at end of routine =",MAXMEM," ",CDNAME
#ifdef RS6K
      IF(JHEAP == 2) CALL XL__TRBK()
#endif
    ENDIF
  ENDIF
!JFH------------ End ---------------------------------------------
  CALL C_DRHOOK_END  (CDNAME, IMYTID, PKEY, CDFILENAME, KSIZEINFO)
ENDIF
! calling the drHackFunction
IF (LL_DRHACK) THEN 
  CALL DR_HACK(CDNAME,KCASE,NULDRHACK)
ENDIF



!GM---Code to find gstats SUMB time-------------------------------
IF( LDETAILED_STATS .AND. LLFINDSUMB )THEN
  IF( IMYTID==1 .AND. LAST_KNUM>=500 .AND. MYPROC_STATS <= 2 )THEN
    IF( LAST_KSWITCH==1 .OR. LAST_KSWITCH==2 )THEN
      CALL USER_CLOCK(PELAPSED_TIME=ZCLOCK)
      ZDIFF=ZCLOCK-TIME_LAST_CALL
      IF( ZDIFF > 0.1_JPRB )THEN
        IF( KCASE == 0 )THEN
          CLSTR='ENTERED'
        ELSE
          CLSTR='EXITED'
        ENDIF
        IF( NHOOK_MESSAGES < 100000 )THEN
          WRITE(0,'("DR_HOOK_UTIL: ",A,2X,A," TIMESUMB=",F10.6)')CDNAME,CLSTR,ZDIFF
          NHOOK_MESSAGES=NHOOK_MESSAGES+1
        ENDIF
      ENDIF
    ENDIF
  ENDIF
ENDIF
!GM------------ End ---------------------------------------------

END SUBROUTINE DR_HOOK_UTIL

SUBROUTINE DR_HACK(ROUTINE,START,DRHACKUNIT)
! Different implementation of this have been tested, but this one, even if it is
! not elegant at all, is almost fast.... 

USE PARKIND1  ,ONLY : JPIM
IMPLICIT NONE
CHARACTER(LEN=*),INTENT(IN) :: ROUTINE
INTEGER(KIND=JPIM),INTENT(IN) :: START
INTEGER(KIND=JPIM),INTENT(IN) :: DRHACKUNIT
INTEGER(KIND=JPIM) :: i
CHARACTER(LEN(ROUTINE)) :: ROUTINE_CLEAN

! replace some special character
DO i = 1,LEN(ROUTINE)
 SELECT CASE (ROUTINE(i:i))
  CASE ("<")
   ROUTINE_CLEAN (i:i)="_"
  CASE (">")
   ROUTINE_CLEAN (i:i)="_"
  CASE (":")
   ROUTINE_CLEAN (i:i)="_"
  CASE (" ")
   ROUTINE_CLEAN (i:i)="_"
  CASE DEFAULT
   ROUTINE_CLEAN (i:i)=ROUTINE(i:i)
 END SELECT
END DO


IF (START==0) THEN
 WRITE(DRHACKUNIT,*) '<',ROUTINE_CLEAN,'>'
ELSE
 WRITE(DRHACKUNIT,*) '</',ROUTINE_CLEAN,'>'
 !CLOSE FILE IF LAST ROUTINE
 IF (ROUTINE_CLEAN .eq. 'MODEL_MOD_MODEL_DELETE') THEN
   CLOSE (DRHACKUNIT)
 ENDIF
ENDIF

END SUBROUTINE DR_HACK


