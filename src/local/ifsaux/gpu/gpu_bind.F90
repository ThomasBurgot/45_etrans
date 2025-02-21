SUBROUTINE GPU_BIND (KTASK, KSIZE)

#ifdef _OPENACC
USE OPENACC
#endif
USE PARKIND1, ONLY : JPIM

IMPLICIT NONE

INTEGER (KIND=JPIM), INTENT (IN) :: KTASK, KSIZE

INTEGER (KIND=JPIM) :: NDEV, IDEV, IDTY

#ifdef _OPENACC
!$acc init

IDTY = ACC_GET_DEVICE_TYPE ()
NDEV = ACC_GET_NUM_DEVICES (IDTY)
IDEV = MOD (KTASK, NDEV)
CALL ACC_SET_DEVICE_NUM (IDEV, ACC_GET_DEVICE_TYPE ())
#endif

END SUBROUTINE
