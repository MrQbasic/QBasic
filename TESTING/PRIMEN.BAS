CLS
10
DIM s AS STRING
DIM x AS INTEGER
INPUT "anzahl ", x1
FOR x = 1 TO x1
FOR i = 2 TO x
FOR i1 = 2 TO x
IF (x / i) = i1 THEN GOTO 20
NEXT i1
NEXT i
PRINT x;
PLAY "T150C8"
20
NEXT x
PRINT "DONE"
PLAY "T150g8"
PLAY "T150a8"
PLAY "T150g8"
FOR x = 0 TO 100
NEXT x
INPUT "y to repeat ", s
IF s = "y" THEN GOTO 10


   

