C
C $Id: mdutid.f,v 1.3 2008-07-27 00:17:09 haley Exp $
C
C                Copyright (C)  2000
C        University Corporation for Atmospheric Research
C                All Rights Reserved
C
C The use of this Software is governed by a License Agreement.
C
      SUBROUTINE MDUTID (UVAL,VVAL,RLAT,RLON)
C
C Given UVAL and VVAL, in meters, return RLAT and RLON, in degrees.
C
        DOUBLE PRECISION UVAL,VVAL,RLAT,RLON
C
C Declare common blocks required to communicate with USGS code.
C
        COMMON /ERRMZ0/ IERR
        SAVE   /ERRMZ0/
C
        COMMON /USGSC1/  UTPA(15),UUMN,UUMX,UVMN,UVMX,IPRF
        DOUBLE PRECISION UTPA,UUMN,UUMX,UVMN,UVMX
        INTEGER IPRF
        SAVE   /USGSC1/
C
C Declare required double-precision coordinate arrays.
C
        DOUBLE PRECISION CRDI(2),CRDO(2),CRDT(2)
C
C Define a couple of conversion constants.
C
        DOUBLE PRECISION DTOR,RTOD
C
        DATA DTOR / .017453292519943D0 /
        DATA RTOD / 57.2957795130823D0 /
C
C Do a call forcing a BLOCKDATA to be loaded from a binary library.
C
        CALL GTPZBD
C
C If the USGS package is initialized, zero the error flag; otherwise,
C take an error exit.
C
        IF (IPRF.GE.3.AND.IPRF.LE.23) THEN
          IERR=0
        ELSE
          IERR=1
          RLAT=1.D12
          RLON=1.D12
          RETURN
        END IF
C
C Generate coordinates for projection routine.
C
        CRDI(1)=UVAL
        CRDI(2)=VVAL
C
        GO TO (        103,104,105,106,107,108,109,110,
     +         111,112,113,114,115,116,117,118,119,120,
     +         121,122,123                             ) , IPRF-2
C
  103   CALL PJ03DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ03DP (CRDO,CRDT,0)
        GO TO 201
C
  104   CALL PJ04DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ04DP (CRDO,CRDT,0)
        GO TO 201
C
  105   CALL PJ05DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ05DP (CRDO,CRDT,0)
        GO TO 201
C
  106   CALL PJ06DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ06DP (CRDO,CRDT,0)
        GO TO 201
C
  107   CALL PJ07DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ07DP (CRDO,CRDT,0)
        GO TO 201
C
  108   CALL PJ08DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ08DP (CRDO,CRDT,0)
        GO TO 201
C
  109   CALL PJ09DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ09DP (CRDO,CRDT,0)
        GO TO 201
C
  110   CALL PJ10DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ10DP (CRDO,CRDT,0)
        GO TO 201
C
  111   CALL PJ11DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ11DP (CRDO,CRDT,0)
        GO TO 201
C
  112   CALL PJ12DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ12DP (CRDO,CRDT,0)
        GO TO 201
C
  113   CALL PJ13DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ13DP (CRDO,CRDT,0)
        GO TO 201
C
  114   CALL PJ14DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ14DP (CRDO,CRDT,0)
        GO TO 201
C
  115   CALL PJ15DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ15DP (CRDO,CRDT,0)
        GO TO 201
C
  116   CALL PJ16DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ16DP (CRDO,CRDT,0)
        GO TO 201
C
  117   CALL PJ17DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ17DP (CRDO,CRDT,0)
        GO TO 201
C
  118   CALL PJ18DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ18DP (CRDO,CRDT,0)
        GO TO 201
C
  119   CALL PJ19DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ19DP (CRDO,CRDT,0)
        GO TO 201
C
  120   CALL PJ20DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ20DP (CRDO,CRDT,0)
        GO TO 201
C
  121   IF (CRDI(1).GE.-3.096982037908766D0*UTPA(1).AND.
     +      CRDI(1).LE.+3.096982037908766D0*UTPA(1).AND.
     +      CRDI(2).GE.-1.570796326793281D0*UTPA(1).AND.
     +      CRDI(2).LE.+1.570796326793281D0*UTPA(1)) THEN
          CALL PJ21DP (CRDI,CRDO,1)
          IF (IERR.EQ.0) CALL PJ21DP (CRDO,CRDT,0)
        ELSE
          IERR=1
        END IF
C
        GO TO 201
C
  122   CALL PJ22DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ22DP (CRDO,CRDT,0)
        GO TO 201
C
  123   CALL PJ23DP (CRDI,CRDO,1)
        IF (IERR.EQ.0) CALL PJ23DP (CRDO,CRDT,0)
        GO TO 201
C
  201   IF (IERR.EQ.0) THEN
          IF (ABS(CRDT(1)-CRDI(1)).LT.1.D-5*(UUMX-UUMN).AND.
     +        ABS(CRDT(2)-CRDI(2)).LT.1.D-5*(UVMX-UVMN)) THEN
            RLAT=REAL(RTOD*CRDO(2))
            RLON=REAL(RTOD*CRDO(1))
          ELSE
            RLAT=1.D12
            RLON=1.D12
            IERR=1
          END IF
        ELSE
          RLAT=1.D12
          RLON=1.D12
          IERR=2
        END IF
C
        RETURN
C
      END
