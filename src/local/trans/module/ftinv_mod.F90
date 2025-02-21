MODULE FTINV_MOD
CONTAINS
SUBROUTINE FTINV(PREEL,KFIELDS)

!**** *FTINV - Inverse Fourier transform

!     Purpose. Routine for Fourier to Grid-point transform
!     --------

!**   Interface.
!     ----------
!        CALL FTINV(..)

!        Explicit arguments :  PREEL   - Fourier/grid-point array
!        --------------------  KFIELDS - number of fields

!     Method.
!     -------

!     Externals.  FFT992 - FFT routine
!     ----------
!

!     Author.
!     -------
!        Mats Hamrud *ECMWF*

!     Modifications.
!     --------------
!        Original : 00-03-03
!        G. Radnoti 01-04-24 : 2D model (NLOEN=1)
!        D. Degrauwe  (Feb 2012): Alternative extension zone (E')
!        G. Mozdzynski (Oct 2014): support for FFTW transforms
!        G. Mozdzynski (Jun 2015): Support alternative FFTs to FFTW
!     ------------------------------------------------------------------

USE PARKIND1  ,ONLY : JPIM, JPRBT

USE TPM_DISTR       ,ONLY : D, MYSETW,  MYPROC, NPROC
USE TPM_GEOMETRY    ,ONLY : G
use tpm_gen, only: nout
USE TPM_FFT         ,ONLY : T, TB
USE BLUESTEIN_MOD   ,ONLY : BLUESTEIN_FFT
#ifdef WITH_FFTW
USE TPM_FFTW        ,ONLY : TW, EXEC_FFTW
#endif
USE TPM_FFTC        ,ONLY : CREATE_PLAN_FFT, destroy_plan_fft
USE TPM_DIM         ,ONLY : R
USE CUDA_DEVICE_MOD

IMPLICIT NONE

INTEGER(KIND=JPIM),INTENT(IN) :: KFIELDS
INTEGER(KIND=JPIM) :: KGL
REAL(KIND=JPRBT), INTENT(INOUT)  :: PREEL(:,:)

REAL(KIND=JPRBT),ALLOCATABLE :: ZFFT(:,:)

INTEGER(KIND=JPIM) :: IGLG,IST,ILEN,IJUMP,JJ,JF,IST1
INTEGER(KIND=JPIM) :: IOFF,IRLEN,ICLEN, ITYPE
LOGICAL :: LL_ALL=.FALSE. ! T=do kfields ffts in one batch, F=do kfields ffts one at a time
INTEGER(KIND=JPIM) :: IPLAN_C2R
INTEGER(KIND=JPIM) :: IBEG,IEND,IINC,ISIZE
integer :: istat

!     ------------------------------------------------------------------



IF(MYPROC > NPROC/2)THEN
  IBEG=1
  IEND=D%NDGL_FS
  IINC=1
ELSE
  IBEG=D%NDGL_FS
  IEND=1
  IINC=-1
ENDIF

ISIZE=size(PREEL,1)

!$ACC data &
!$ACC& copyin(D,D%NSTAGTF,D%NPTRLS,G%NMEN,G%NLOEN,R,R%NNOEXTZL) &
!$ACC& copyin(D%NSTAGTF,D%NPTRLS,G%NMEN,G%NLOEN,R%NNOEXTZL) &
!$ACC& present(PREEL)

!$ACC parallel loop
DO KGL=IBEG,IEND,IINC

  !IF( T%LUSEFFT992(kgl) )THEN
  !  stop 'Error: code path not (yet) supported in GPU version'
  !END IF
  
  IJUMP = 1
  IGLG  = D%NPTRLS(MYSETW)+KGL-1
  IST   = 2*(G%NMEN(IGLG)+1)+1
  ILEN  = G%NLOEN(IGLG)+R%NNOEXTZL+3-IST
  IST1=1
  IF (G%NLOEN(IGLG)==1) IST1=0

  !$ACC loop
  DO JJ=IST1,ILEN
     !$ACC loop
     DO JF=1,KFIELDS
        PREEL(JF,IST+D%NSTAGTF(KGL)+JJ-1) = 0.0_JPRBT
     ENDDO
  ENDDO

END DO
!$ACC end data

!istat = cuda_Synchronize()      
DO KGL=ibeg,IEND,IINC

  IJUMP = 1
  IGLG  = D%NPTRLS(MYSETW)+KGL-1
  IST   = 2*(G%NMEN(IGLG)+1)+1
  ILEN  = G%NLOEN(IGLG)+R%NNOEXTZL+3-IST
  IST1=1
  IF (G%NLOEN(IGLG)==1) IST1=0

  IF (G%NLOEN(IGLG)>1) THEN
     IOFF=D%NSTAGTF(KGL)+1

!call cudaProfilerStop()
     CALL CREATE_PLAN_FFT(IPLAN_C2R,1,KN=G%NLOEN(IGLG),KLOT=KFIELDS)
     !$ACC host_data use_device(PREEL)
     CALL EXECUTE_PLAN_FFTC(IPLAN_C2R,1,PREEL(1, ioff))
     !$ACC end host_data
!call cudaProfilerStart()

  ENDIF

END DO
istat = cuda_Synchronize()      


!     ------------------------------------------------------------------

END SUBROUTINE FTINV
END MODULE FTINV_MOD
