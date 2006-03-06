C
C $Id: tdsort.f,v 1.4 2006-03-06 22:00:27 kennison Exp $
C
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C This file is free software; you can redistribute it and/or modify
C it under the terms of the GNU General Public License as published
C by the Free Software Foundation; either version 2 of the License, or
C (at your option) any later version.
C
C This software is distributed in the hope that it will be useful, but
C WITHOUT ANY WARRANTY; without even the implied warranty of
C MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
C General Public License for more details.
C
C You should have received a copy of the GNU General Public License
C along with this software; if not, write to the Free Software
C Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
C USA.
C
      SUBROUTINE TDSORT (RWRK,NRWK,IORD,IWRK)
C
        DIMENSION RWRK(NRWK),IWRK(NRWK)
C
C Given an array of NRWK reals in an array RWRK and an order flag
C IORD, this routine returns a permutation vector IWRK such that, for
C every I and J such that 1.LE.I.LE.J.LE.NRWK, if IORD is zero, then
C RWRK(IWRK(I)).LE.RWRK(IWRK(J)), else RWRK(IWRK(I)).GE.RWRK(IWRK(J)).
C
        DO 101 I=1,NRWK
          IWRK(I)=I
  101   CONTINUE
C
        K=0
C
  102   IF (3*K+1.LT.NRWK) THEN
          K=3*K+1
          GO TO 102
        END IF
C
        IF (IORD.EQ.0) THEN
C
  103     IF (K.GT.0) THEN
C
            DO 105 I=1,NRWK-K
C
              J=I
C
  104         IF (RWRK(IWRK(J)).LE.RWRK(IWRK(J+K))) GO TO 105
              ITMP=IWRK(J)
              IWRK(J)=IWRK(J+K)
              IWRK(J+K)=ITMP
              J=J-K
              IF (J.LT.1) GO TO 105
              GO TO 104
C
  105       CONTINUE
C
            K=(K-1)/3
C
            GO TO 103
C
          END IF
C
        ELSE
C
  106     IF (K.GT.0) THEN
C
            DO 108 I=1,NRWK-K
C
              J=I
C
  107         IF (RWRK(IWRK(J)).GE.RWRK(IWRK(J+K))) GO TO 108
              ITMP=IWRK(J)
              IWRK(J)=IWRK(J+K)
              IWRK(J+K)=ITMP
              J=J-K
              IF (J.LT.1) GO TO 108
              GO TO 107
C
  108       CONTINUE
C
            K=(K-1)/3
C
            GO TO 106
C
          END IF
C
        END IF
C
C Done.
C
        RETURN
C
      END
