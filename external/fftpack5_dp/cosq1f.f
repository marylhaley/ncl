CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C   FFTPACK 5.0
C   Copyright (C) 1995-2004, Scientific Computing Division,
C   University Corporation for Atmospheric Research
C   Licensed under the GNU General Public License (GPL)
C
C   Authors:  Paul N. Swarztrauber and Richard A. Valent
C
C   $Id: cosq1f.f,v 1.2 2006-11-21 01:10:16 haley Exp $
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      SUBROUTINE DCOSQ1F(N,INC,X,LENX,WSAVE,LENSAV,WORK,LENWRK,IER)
      DOUBLE PRECISION SSQRT2
      DOUBLE PRECISION TSQX
      INTEGER N,INC,LENX,LENSAV,LENWRK,IER
      DOUBLE PRECISION X(INC,*),WSAVE(LENSAV),WORK(LENWRK)
C
      IER = 0
C
      IF (LENX.LT.INC* (N-1)+1) THEN
          IER = 1
          CALL DXERFFT('COSQ1F',6)
          GO TO 300
      ELSE IF (LENSAV.LT.2*N+INT(LOG(DBLE(N)))+4) THEN
          IER = 2
          CALL DXERFFT('COSQ1F',8)
          GO TO 300
      ELSE IF (LENWRK.LT.N) THEN
          IER = 3
          CALL DXERFFT('COSQ1F',10)
          GO TO 300
      END IF
C
      IF (N-2) 102,101,103
  101 SSQRT2 = 1.D0/SQRT(2.D0)
      TSQX = SSQRT2*X(1,2)
      X(1,2) = .5D0*X(1,1) - TSQX
      X(1,1) = .5D0*X(1,1) + TSQX
  102 RETURN
  103 CALL DCOSQF1(N,INC,X,WSAVE,WORK,IER1)
      IF (IER1.NE.0) THEN
          IER = 20
          CALL DXERFFT('COSQ1F',-5)
      END IF
C
  300 CONTINUE
      RETURN
      END
