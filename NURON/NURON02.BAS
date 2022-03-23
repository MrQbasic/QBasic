SCREEN 0
CLS
DIM nramount AS INTEGER
DIM nraods AS INTEGER
DIM nrlr
DIM amp AS INTEGER
INPUT "hit key to start", m
'setup
amp = (5) - 1
nramount = 1
nraods = 4
nrlr = 1

DIM inpu1 AS STRING
DIM nristraining AS INTEGER
DIM inpu(nramount) AS INTEGER
DIM datatrain(nramount, nraods) AS INTEGER
DIM datatest(nramount, nraods) AS INTEGER
DIM x(nramount, nraods) AS INTEGER
DIM w(nramount) AS INTEGER
DIM nrsummout(nramount) AS INTEGER
DIM nrpout(nramount) AS INTEGER
DIM nrajust(nramount) AS INTEGER
DIM nrtraindone AS INTEGER
DIM nrcl AS INTEGER

'train data
DATA 10,-10
DATA 20,-20
DATA 30,-30
DATA 40,-40
DATA 50,-50

'test data
DATA 0,0
DATA 0,0
DATA 0,0
DATA 1,1
DATA 1,1
'read in data
PRINT "data read in"
PRINT "train data"
FOR i1 = 0 TO nraods
FOR i2 = 0 TO nramount
        READ datatrain(i2, i1)
        PRINT datatrain(i2, i1);
        x(i2, i1) = datatrain(i2, i1)
NEXT i2
PRINT ""
NEXT i1

PRINT ""
PRINT "test data"
FOR i1 = 0 TO nraods
FOR i2 = 0 TO nramount
        READ datatest(i2, i1)
        PRINT datatest(i2, i1);
NEXT i2
PRINT ""
NEXT i1


'trainig
PRINT "training"
nristraining = 1
FOR nrcl = 0 TO nraods
nrtraindone = 0

FOR xyz = 0 TO amp
PRINT "amp", xyz
GOTO nrsumm
back0:
GOTO nrp
back1:
GOTO nrcheck
back2:
GOTO nrajust
back3:
NEXT xyz

GOTO nrshowlog
back5:
NEXT nrcl


GOTO nrtesting
END


'functions
nrsumm:
FOR i = 0 TO nramount
        nrsummout(i) = x(i, nrcl) + w(i)
NEXT i
GOTO back0
'------------------------------------------------
nrp:
FOR i = 0 TO nramount
      copy = nrsummout(i)
      IF copy < 0 THEN
        nrpout(i) = 0
      END IF
      IF copy > 0 THEN
        nrpout(i) = 1
      END IF
      IF copy = 0 THEN
        nrpout(i) = 0
      END IF
      IF nristraining = 0 THEN
        PRINT i; "p ="; nrpout(i)
      END IF
NEXT i
IF nristraining = 1 THEN GOTO back1
IF nristraining = 0 THEN GOTO back4

'------------------------------------------------
nrcheck:
FOR i = 0 TO nramount
        nrajust(i) = 0
       
        IF datatest(i, nrcl) = nrpout(i) THEN
                nrajust(i) = 1
        END IF
NEXT i
GOTO back2

'------------------------------------------------
nrajust:
FOR i = 0 TO nramount
        IF nrajust(i) = 1 THEN
                nrtraindone = 1
        END IF

        IF nrajust(i) = 0 THEN
                IF datatrain(i, nrcl) > 0 THEN w(i) = w(i) + (0 - nrlr)
                IF datatrain(i, nrcl) < 0 THEN w(i) = w(i) + nrlr
                nrtraindone = 0
        END IF
NEXT i
GOTO back3

'------------------------------------------------
nrshowlog:
PRINT "datenstatz:"; nrcl + 1
FOR i = 0 TO nramount
        PRINT i; "w: "; w(i)
NEXT i
GOTO back5

'------------------------------------------------
nrtesting:
PRINT "testing"
nrcl = 0
nristraining = 0

DO
INPUT "y to ajust wights ", inpu1
IF (inpu1) = ("y") THEN
FOR i = 0 TO nramount
PRINT i; w(i);
INPUT "change to:", w(i)
NEXT i
END IF
INPUT "y to test ", inpu1
IF inpu1 = "y" THEN
FOR i = 0 TO nramount
PRINT i;
INPUT "input", inpu(i)
NEXT i
FOR i = 0 TO nramount
nrsummout(i) = inpu(i) + w(i)
NEXT i
GOTO nrp
back4:
END IF
INPUT "y to repeat", inpu1
LOOP WHILE inpu1 = "y"

END

