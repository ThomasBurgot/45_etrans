MODULE TRMTOL_MOD

CONTAINS
SUBROUTINE TRMTOL_CUDAAWARE(PFBUF_IN,PFBUF,KFIELD)

!**** *trmtol * - transposition in Fourier space

!     Purpose.
!     --------
!              Transpose Fourier buffer data from partitioning
!              over wave numbers to partitioning over latitudes.
!              It is called between direct FFT and direct Legendre
!              transform.
!              This routine is the inverse of TRLTOM.


!**   Interface.
!     ----------
!        *call* *trmtol(...)*

!        Explicit arguments : PFBUF  - Fourier coefficient buffer. It is
!        --------------------          used for both input and output.
!                             KFIELD - Number of fields communicated

!        Implicit arguments :
!        --------------------

!     Method.
!     -------
!        See documentation

!     Externals.
!     ----------

!     Reference.
!     ----------
!        ECMWF Research Department documentation of the IFS

!     Author.
!     -------
!        MPP Group *ECMWF*

!     Modifications.
!     --------------
!        Original : 95-10-01
!        Modified : 97-06-17 G. Mozdzynski - control MPI mailbox use
!                                            (NCOMBFLEN) for nphase.eq.1
!        Modified : 99-05-28  D.Salmond - Optimise copies.
!        Modified : 00-02-02  M.Hamrud  - Remove NPHASE
!        D.Salmond : 01-11-23 LIMP_NOOLAP Option for non-overlapping message
!                             passing and buffer packing
!        G.Mozdzynski: 08-01-01 Cleanup
!        Y.Seity   : 07-08-31 add barrien synchronisation under LSYNC_TRANS
!     ------------------------------------------------------------------


USE PARKIND1  ,ONLY : JPIM     ,JPRBT, JPRB
USE YOMHOOK   ,ONLY : LHOOK,   DR_HOOK

USE MPL_MODULE  ,ONLY : MPL_BARRIER, MPL_WAIT, JP_NON_BLOCKING_STANDARD, MPL_ALL_MS_COMM
USE MPL_MODULE  ,ONLY : MPL_ALLTOALLV_REAL8, MPL_ALLTOALLV

USE TPM_DISTR       ,ONLY : D, MTAGML, MYSETW, NPRTRW, NPROC, MYPROC
USE TPM_GEN         ,ONLY : LSYNC_TRANS


IMPLICIT NONE


INTEGER(KIND=JPIM) ,INTENT(IN)    :: KFIELD
REAL(KIND=JPRBT)   ,INTENT(INOUT) :: PFBUF(:)
REAL(KIND=JPRBT)   ,INTENT(INOUT) :: PFBUF_IN(:)

INTEGER(KIND=JPIM) :: ILENS(NPRTRW),IOFFS(NPRTRW),ILENR(NPRTRW),IOFFR(NPRTRW)

INTEGER(KIND=JPIM) :: ITAG, J, ILEN, ISTA
 
REAL(KIND=JPRB) :: ZHOOK_HANDLE
REAL(KIND=JPRB) :: ZHOOK_HANDLE_BAR
REAL(KIND=JPRB) :: ZHOOK_HANDLE_BAR2

REAL(KIND=JPRBT)    :: ZDUM(1)
INTEGER(KIND=JPIM) :: IREQ


!     ------------------------------------------------------------------

IF (LHOOK) CALL DR_HOOK('TRMTOL_CUDAAWARE',0,ZHOOK_HANDLE)


ITAG = MTAGML

DO J=1,NPRTRW
  ILENS(J) = D%NLTSFTB(J)*KFIELD
  IOFFS(J) = D%NSTAGT0B(J)*KFIELD
  ILENR(J) = D%NLTSGTB(J)*KFIELD
  IOFFR(J) = D%NSTAGT0B(D%MSTABF(J))*KFIELD
ENDDO

IF(NPROC > 1) THEN
  CALL GSTATS(807,0)

  ! TODO THIS IS A HACK. SELF COPIES ARE SLOW USING MPI_ALLTOALLV.
  ! --> Here I simply do a openacc copy for the self-to-self
  !$ACC kernels present(PFBUF, PFBUF_IN)
  DO J = IOFFR(MYSETW)+1, IOFFR(MYSETW)+ILENR(MYSETW)+1
    PFBUF(J) = PFBUF_IN(J)
  ENDDO
  !$ACC end kernels

  ILENS(MYSETW) = 0
  ILENR(MYSETW) = 0
  ! THOMAS
  !$ACC host_data use_device(PFBUF_IN,PFBUF)
  ! Generic interface does not work with host_data directive
  ! To be reported to NVIDIA/PGI
  CALL MPL_ALLTOALLV_REAL8(PSENDBUF=PFBUF_IN,KSENDCOUNTS=ILENS,&
   & PRECVBUF=PFBUF,KRECVCOUNTS=ILENR,KSENDDISPL=IOFFS,KRECVDISPL=IOFFR,&
   & KCOMM=MPL_ALL_MS_COMM,CDSTRING='TRMTOL_CUDAAWARE:')
  !$ACC end host_data

  CALL GSTATS(807,1)
ELSE

  ILEN = D%NLTSGTB(MYSETW)*KFIELD
  ISTA = D%NSTAGT0B(MYSETW)*KFIELD+1

  CALL GSTATS(1608,0)
  !$ACC data present(PFBUF_IN,PFBUF)
  !$ACC parallel loop
  DO J=ISTA,ISTA+ILEN-1
    PFBUF(J) = PFBUF_IN(J)
  ENDDO
  !$ACC end data

  CALL GSTATS(1608,1)
ENDIF

IF (LHOOK) CALL DR_HOOK('TRMTOL_CUDAAWARE',1,ZHOOK_HANDLE)

!     ------------------------------------------------------------------

END SUBROUTINE TRMTOL_CUDAAWARE

SUBROUTINE TRMTOL(PFBUF_IN,PFBUF,KFIELD)

!**** *trmtol * - transposition in Fourier space

!     Purpose.
!     --------
!              Transpose Fourier buffer data from partitioning
!              over wave numbers to partitioning over latitudes.
!              It is called between direct FFT and direct Legendre
!              transform.
!              This routine is the inverse of TRLTOM.


!**   Interface.
!     ----------
!        *call* *trmtol(...)*

!        Explicit arguments : PFBUF  - Fourier coefficient buffer. It is
!        --------------------          used for both input and output.
!                             KFIELD - Number of fields communicated

!        Implicit arguments :
!        --------------------

!     Method.
!     -------
!        See documentation

!     Externals.
!     ----------

!     Reference.
!     ----------
!        ECMWF Research Department documentation of the IFS

!     Author.
!     -------
!        MPP Group *ECMWF*

!     Modifications.
!     --------------
!        Original : 95-10-01
!        Modified : 97-06-17 G. Mozdzynski - control MPI mailbox use
!                                            (NCOMBFLEN) for nphase.eq.1
!        Modified : 99-05-28  D.Salmond - Optimise copies.
!        Modified : 00-02-02  M.Hamrud  - Remove NPHASE
!        D.Salmond : 01-11-23 LIMP_NOOLAP Option for non-overlapping message
!                             passing and buffer packing
!        G.Mozdzynski: 08-01-01 Cleanup
!        Y.Seity   : 07-08-31 add barrien synchronisation under LSYNC_TRANS
!     ------------------------------------------------------------------


USE PARKIND1  ,ONLY : JPIM     ,JPRBT, JPRB
USE YOMHOOK   ,ONLY : LHOOK,   DR_HOOK

USE MPL_MODULE  ,ONLY : MPL_ALLTOALLV, MPL_BARRIER, MPL_ALL_MS_COMM, MPL_WAIT, JP_NON_BLOCKING_STANDARD, MPL_MYRANK

USE TPM_DISTR       ,ONLY : D, MTAGML, MYSETW, NPRTRW, NPROC, MYPROC
USE TPM_GEN         ,ONLY : LSYNC_TRANS


IMPLICIT NONE


INTEGER(KIND=JPIM),INTENT(IN)    :: KFIELD
REAL(KIND=JPRBT)   ,INTENT(INOUT) :: PFBUF(:)
REAL(KIND=JPRBT)   ,INTENT(INOUT) :: PFBUF_IN(:)

INTEGER(KIND=JPIM) :: ILENS(NPRTRW),IOFFS(NPRTRW),ILENR(NPRTRW),IOFFR(NPRTRW)

INTEGER(KIND=JPIM) :: ITAG, J, ILEN, ISTA
 
REAL(KIND=JPRB) :: ZHOOK_HANDLE
REAL(KIND=JPRB) :: ZHOOK_HANDLE_BAR
REAL(KIND=JPRB) :: ZHOOK_HANDLE_BAR2

REAL(KIND=JPRBT)    :: ZDUM(1)
INTEGER(KIND=JPIM) :: IREQ


!     ------------------------------------------------------------------

IF (LHOOK) CALL DR_HOOK('TRMTOL',0,ZHOOK_HANDLE)


ITAG = MTAGML

DO J=1,NPRTRW
  ILENS(J) = D%NLTSFTB(J)*KFIELD
  IOFFS(J) = D%NSTAGT0B(J)*KFIELD
  ILENR(J) = D%NLTSGTB(J)*KFIELD
  IOFFR(J) = D%NSTAGT0B(D%MSTABF(J))*KFIELD
ENDDO

!!!$ACC UPDATE HOST(PFBUF,PFBUF_IN)
!write(300+myproc,*)"0:TRMTOL:PFBUF",sum(PFBUF)
!write(300+myproc,*)"0:TRMTOL:PFBUF_IN",sum(PFBUF_IN)
!call flush(300)
IF(NPROC > 1) THEN
  IF (LHOOK) CALL DR_HOOK('TRMTOL_BAR',0,ZHOOK_HANDLE_BAR)
 ! CALL GSTATS_BARRIER(764)
  IF (LHOOK) CALL DR_HOOK('TRMTOL_BAR',1,ZHOOK_HANDLE_BAR)
! IF (LSYNC_TRANS) THEN
!   CALL MPL_BARRIER(CDSTRING='TRMTOL')
! ENDIF

  CALL GSTATS(807,0)
!$ACC UPDATE HOST(PFBUF_IN)
  CALL MPL_ALLTOALLV(PSENDBUF=PFBUF_IN,KSENDCOUNTS=ILENS,&
   & PRECVBUF=PFBUF,KRECVCOUNTS=ILENR,KSENDDISPL=IOFFS,KRECVDISPL=IOFFR,&
   & KCOMM=MPL_ALL_MS_COMM,CDSTRING='TRMTOL:')
!$ACC UPDATE DEVICE (PFBUF)
  CALL GSTATS(807,1)
  IF (LHOOK) CALL DR_HOOK('TRMTOL_BAR2',0,ZHOOK_HANDLE_BAR2)
  !CALL GSTATS_BARRIER2(764)
  IF (LHOOK) CALL DR_HOOK('TRMTOL_BAR2',1,ZHOOK_HANDLE_BAR2)
ELSE
  ILEN = D%NLTSGTB(MYSETW)*KFIELD
  ISTA = D%NSTAGT0B(MYSETW)*KFIELD+1
  CALL GSTATS(1608,0)
  !$ACC DATA present(PFBUF_IN,PFBUF)
  !$ACC parallel loop
  DO J=ISTA,ISTA+ILEN-1
    PFBUF(J) = PFBUF_IN(J)
  ENDDO
  !$ACC END DATA
  CALL GSTATS(1608,1)
ENDIF
!write(300+myproc,*)"10:TRMTOL:PFBUF",sum(PFBUF), KFIELD, D%NLTSGTB(MYSETW), MYSETW, D%NSTAGT0B(MYSETW), D%NLTSFTB(MYSETW), D%MSTABF(MYSETW)
!write(300+myproc,*)"10:TRMTOL:PFBUF_IN",sum(PFBUF_IN)
!call flush(300+myproc)

IF (LHOOK) CALL DR_HOOK('TRMTOL',1,ZHOOK_HANDLE)

!     ------------------------------------------------------------------

END SUBROUTINE TRMTOL
END MODULE TRMTOL_MOD
