
CLS
SCREEN 12

DIM hx AS INTEGER
DIM hy AS INTEGER
DIM rp(nofp, 2, 2) AS INTEGER
DIM raon AS INTEGER

DIM in1 AS INTEGER
DIM in2 AS INTEGER
DIM in3 AS INTEGER

PRINT "press button"
SLEEP


'-----X--Y--Z

DATA 100,101,0
DATA 150,101,0
DATA 150,151,0

DATA 200,100,0
DATA 250,100,0
DATA 250,150,0

DATA 999


DO


READ in1
PRINT "in1 ="; in1
IF in1 = 999 THEN GOTO exit1
READ in2
READ in3



LOOP WHILE 1 = 1




exit1:
PRINT "exit read in loop"
PRINT "plligons ="; raon
PRINT "press button"
SLEEP
CLS
PAINT (1, 1), 1






END
col = 2
PRINT raon
GOTO drawsub
backdraw:

END





drawsub:
FOR i1 = 0 TO raon
rp(i1, 0, 1) = rp(i1, 0, 1) - rp(i1, 0, 2)
rp(i1, 1, 1) = rp(i1, 1, 1) - rp(i1, 1, 2)
rp(i1, 2, 1) = rp(i1, 2, 1) - rp(i1, 2, 2)
NEXT i1

FOR i1 = 0 TO raon
PRINT i1; rp(i1, 0, 1); rp(i1, 1, 1); rp(i1, 2, 1)
NEXT i1

GOTO backdraw

FOR i1 = 0 TO raon
LINE (rp(i1, 0, 0), rp(i1, 0, 1))-(rp(i1, 1, 0), rp(i1, 1, 1)), col
LINE (rp(i1, 1, 0), rp(i1, 1, 1))-(rp(i1, 2, 0), rp(i1, 2, 1)), col
LINE (rp(i1, 2, 0), rp(i1, 2, 1))-(rp(i1, 0, 0), rp(i1, 0, 1)), col
NEXT i1
FOR x = 0 TO 100: NEXT x
FOR i1 = 0 TO raon
LINE (rp(i1, 0, 0), rp(i1, 0, 1))-(rp(i1, 1, 0), rp(i1, 1, 1)), 1
LINE (rp(i1, 1, 0), rp(i1, 1, 1))-(rp(i1, 2, 0), rp(i1, 2, 1)), 1
LINE (rp(i1, 2, 0), rp(i1, 2, 1))-(rp(i1, 0, 0), rp(i1, 0, 1)), 1
NEXT i1
GOTO backdraw

