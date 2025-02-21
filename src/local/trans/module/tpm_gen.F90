MODULE TPM_GEN

! Module for general control variables.

USE PARKIND1  ,ONLY : JPIM     ,JPRBT

IMPLICIT NONE

SAVE

INTEGER(KIND=JPIM) :: NOUT            ! Unit number for "standard" output
INTEGER(KIND=JPIM) :: NERR            ! Unit number for error messages
INTEGER(KIND=JPIM) :: NPRINTLEV       ! Printing level, 0=no print, 1=standard,2=debug

INTEGER(KIND=JPIM) :: MSETUP0 = 0     ! Control of setup calls
INTEGER(KIND=JPIM) :: NMAX_RESOL = 0  ! Maximum allowed number of resolutions
INTEGER(KIND=JPIM) :: NCUR_RESOL = 0  ! Current resolution
INTEGER(KIND=JPIM) :: NDEF_RESOL = 0  ! Number of defined resolutions
INTEGER(KIND=JPIM) :: NPROMATR        ! Packet size for transform (in no of fields)
                             ! NPROMATR=0 means do all fields together (dflt)

LOGICAL   :: LALLOPERM       ! Allocate some shared data structures permanently
LOGICAL   :: LALLOPERM2
LOGICAL   :: LMPOFF          ! true: switch off message passing
LOGICAL   :: LSYNC_TRANS     ! true: activate barriers in trmtol and trltom

! Use of synchronization/blocking in Transpose (some networks do get flooded)
! 0 = Post IRECVs up-front, use ISENDs, use WAITANY to recv data (default)
! 1 = Use ISENDs, use blocking RECVs, add barrier at the end of each cycle
! 2 = Use buffered SENDs, use blocking RECVs, add barrier at the end of each cycle
INTEGER(KIND=JPIM) :: NTRANS_SYNC_LEVEL = 0

LOGICAL, ALLOCATABLE :: LENABLED(:)   ! true: the resolution is enabled (it has been
                                      ! initialised and has not been released afterward) 

END MODULE TPM_GEN
