MODULE LTDIR_MOD
  CONTAINS
SUBROUTINE LTDIR(KF_FS,KF_UV,KF_SCALARS,KLED2,&
 & PSPVOR,PSPDIV,PSPSCALAR,&
 & PSPSC3A,PSPSC3B,PSPSC2, &
 & KFLDPTRUV,KFLDPTRSC)


USE PARKIND1  ,ONLY : JPIM     ,JPRBT ,JPRB
USE YOMHOOK   ,ONLY : LHOOK,   DR_HOOK

USE TPM_DIM         ,ONLY : R
USE TPM_DISTR       ,ONLY : D
USE TPM_GEOMETRY

USE PREPSNM_MOD     ,ONLY : PREPSNM
USE PRFI2_MOD       ,ONLY : PRFI2
USE LDFOU2_MOD      ,ONLY : LDFOU2
USE LEDIR_MOD       ,ONLY : LEDIR
USE UVTVD_MOD
USE UPDSP_MOD       ,ONLY : UPDSP
 
USE TPM_FIELDS      ,ONLY : ZSIA,ZAIA,ZOA1,ZOA2,ZEPSNM

!**** *LTDIR* - Control of Direct Legendre transform step

!     Purpose.
!     --------
!        Tranform from Fourier space to spectral space, compute
!        vorticity and divergence.

!**   Interface.
!     ----------
!        *CALL* *LTDIR(...)*

!        Explicit arguments :
!        --------------------  KM     - zonal wavenumber
!                              KMLOC  - local zonal wavenumber

!        Implicit arguments :  None
!        --------------------

!     Method.
!     -------

!     Externals.
!     ----------
!         PREPSNM - prepare REPSNM for wavenumber KM
!         PRFI2   - prepares the Fourier work arrays for model variables.
!         LDFOU2  - computations in Fourier space
!         LEDIR   - direct Legendre transform
!         UVTVD   -
!         UPDSP   - updating of spectral arrays (fields)

!     Reference.
!     ----------
!        ECMWF Research Department documentation of the IFS

!     Author.
!     -------
!        Mats Hamrud and Philippe Courtier  *ECMWF*

!     Modifications.
!     --------------
!        Original : 87-11-24
!        Modified : 91-07-01 Philippe Courtier/Mats Hamrud - Rewrite
!                            for uv formulation
!        Modified 93-03-19 D. Giard - CDCONF='T' for tendencies
!        Modified 93-11-18 M. Hamrud - use only one Fourier buffer
!        Modified 94-04-06 R. El khatib Full-POS implementation
!        M.Hamrud  : 94-11-01 New conf 'G' - vor,div->vor,div
!                             instead of u,v->vor,div
!        MPP Group : 95-10-01 Support for Distributed Memory version
!        K. YESSAD (AUGUST 1996):
!               - Legendre transforms for transmission coefficients.
!        Modified : 04/06/99 D.Salmond : change order of AIA and SIA
!        R. El Khatib 12-Jul-2012 LDSPC2 replaced by UVTVD
!     ------------------------------------------------------------------

IMPLICIT NONE

INTERFACE
   SUBROUTINE cudaProfilerStart() BIND(C,name='cudaProfilerStart')
     USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT
     IMPLICIT NONE
   END SUBROUTINE cudaProfilerStart
END INTERFACE

INTERFACE
   SUBROUTINE cudaProfilerStop() BIND(C,name='cudaProfilerStop')
     USE, INTRINSIC :: ISO_C_BINDING, ONLY: C_INT
     IMPLICIT NONE
   END SUBROUTINE cudaProfilerStop
END INTERFACE



!     DUMMY INTEGER SCALARS
INTEGER(KIND=JPIM)  :: KM
INTEGER(KIND=JPIM)  :: KMLOC
INTEGER(KIND=JPIM),INTENT(IN)   :: KF_FS,KF_UV,KF_SCALARS,KLED2

REAL(KIND=JPRB)  ,OPTIONAL, INTENT(OUT) :: PSPVOR(:,:)
REAL(KIND=JPRB)  ,OPTIONAL, INTENT(OUT) :: PSPDIV(:,:)
REAL(KIND=JPRB)  ,OPTIONAL, INTENT(OUT) :: PSPSCALAR(:,:)
REAL(KIND=JPRB)   ,OPTIONAL,INTENT(OUT) :: PSPSC2(:,:)
REAL(KIND=JPRB)   ,OPTIONAL,INTENT(OUT) :: PSPSC3A(:,:,:)
REAL(KIND=JPRB)   ,OPTIONAL,INTENT(OUT) :: PSPSC3B(:,:,:)
INTEGER(KIND=JPIM),OPTIONAL,INTENT(IN)  :: KFLDPTRUV(:)
INTEGER(KIND=JPIM),OPTIONAL,INTENT(IN)  :: KFLDPTRSC(:)

!     LOCAL INTEGER SCALARS
INTEGER(KIND=JPIM) :: IFC, IIFC, IDGLU
INTEGER(KIND=JPIM) :: IUS, IUE, IVS, IVE, IVORS, IVORE, IDIVS, IDIVE

REAL(KIND=JPRB) :: ZHOOK_HANDLE


!call cudaProfilerStart

!     ------------------------------------------------------------------
IF (LHOOK) CALL DR_HOOK('LTDIR_MOD',0,ZHOOK_HANDLE)

!     ------------------------------------------------------------------

!*       1.    PREPARE LEGENDRE POLONOMIALS AND EPSNM
!              --------------------------------------


!     ------------------------------------------------------------------

!*       2.    PREPARE WORK ARRAYS.
!              --------------------

CALL PRFI2(KF_FS,ZAIA,ZSIA)
!!!!ACC update host(ZAIA,ZSIA)
!     ------------------------------------------------------------------

!*       3.    FOURIER SPACE COMPUTATIONS.
!              ---------------------------

CALL LDFOU2(KF_UV,ZAIA,ZSIA)
!! !ACC update host(ZAIA,ZSIA)

! !     ------------------------------------------------------------------

! !*       4.    DIRECT LEGENDRE TRANSFORM.
! !              --------------------------
!call cudaProfilerStart
CALL LEDIR(KF_FS,KLED2,ZAIA,ZSIA,ZOA1)
!call cudaProfilerStop
!     ------------------------------------------------------------------

!*       5.    COMPUTE VORTICITY AND DIVERGENCE.
!              ---------------------------------

IF( KF_UV > 0 ) THEN
      !stop 'Error: code path not (yet) supported in GPU version'

   CALL PREPSNM(ZEPSNM)


   IUS = 1
   IUE = 2*KF_UV
   IVS = 2*KF_UV+1
   IVE = 4*KF_UV
   IVORS = 1
   IVORE = 2*KF_UV
   IDIVS = 2*KF_UV+1
   IDIVE = 4*KF_UV
   CALL UVTVD(KF_UV)
   !     CALL UVTVD(KF_UV,ZEPSNM,ZOA1(IUS:IUE,:,:),ZOA1(IVS:IVE,:,:),&
   !  & ZOA2(IVORS:IVORE,:,:),ZOA2(IDIVS:IDIVE,:,:))
ENDIF
!     ------------------------------------------------------------------

!*       6.    UPDATE SPECTRAL ARRAYS.
!              -----------------------

!end loop over wavenumber

!END DO

!loop over wavenumber
!DO KMLOC=1,D%NUMP
!    KM = D%MYMS(KMLOC)

! this is on the host, so need to cp from device, Nils
CALL UPDSP(KF_UV,KF_SCALARS,ZOA1,ZOA2, &
 & PSPVOR,PSPDIV,PSPSCALAR,&
 & PSPSC3A,PSPSC3B,PSPSC2 , &
 & KFLDPTRUV,KFLDPTRSC)

!     ------------------------------------------------------------------

IF (LHOOK) CALL DR_HOOK('LTDIR_MOD',1,ZHOOK_HANDLE)

!end loop over wavenumber
!END DO

!call cudaProfilerStop
END SUBROUTINE LTDIR
END MODULE LTDIR_MOD
