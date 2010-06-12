CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C   FFTPACK 5.0 
C   Copyright (C) 1995-2004, Scientific Computing Division,
C   University Corporation for Atmospheric Research
C   Licensed under the GNU General Public License (GPL)
C
C   Authors:  Paul N. Swarztrauber and Richard A. Valent
C
C   $Id: cosq1b.f,v 1.1 2006-10-27 16:16:27 haley Exp $
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      SUBROUTINE COSQ1B (N, INC, X, LENX, WSAVE, LENSAV, 
     1                   WORK, LENWRK, IER)
      INTEGER    N, INC, LENX, LENSAV, LENWRK, IER
      REAL       X(INC,*), WSAVE(LENSAV), WORK(LENWRK)
C
      IER = 0
C
      IF (LENX .LT. INC*(N-1) + 1) THEN
        IER = 1
        CALL XERFFT ('COSQ1B', 6)
        GO TO 300
      ELSEIF (LENSAV .LT. 2*N + INT(LOG(REAL(N))) +4) THEN
        IER = 2
        CALL XERFFT ('COSQ1B', 8)
        GO TO 300
      ELSEIF (LENWRK .LT. N) THEN
        IER = 3
        CALL XERFFT ('COSQ1B', 10)
        GO TO 300
      ENDIF
C
      IF (N-2) 300,102,103
 102  SSQRT2 = 1./SQRT(2.)
      X1 = X(1,1)+X(1,2)
      X(1,2) = SSQRT2*(X(1,1)-X(1,2))
      X(1,1) = X1
      RETURN
  103 CALL COSQB1 (N,INC,X,WSAVE,WORK,IER1)
      IF (IER1 .NE. 0) THEN
        IER = 20
        CALL XERFFT ('COSQ1B',-5)
      ENDIF
C
  300 RETURN
      END