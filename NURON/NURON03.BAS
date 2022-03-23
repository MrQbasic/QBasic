CLS
DIM hx AS INTEGER
DIM zerostate AS INTEGER
zerostate = 0
PRINT "zerostate ="; zerostate
DIM hy AS INTEGER

ham = 5
'amount of rows

DIM nra(ham) AS INTEGER
DIM nrmax AS INTEGER
DIM nrfo AS INTEGER

DATA 5
DATA 4
DATA 3
DATA 2
DATA 1
'amount of colums per row

FOR i = 0 TO ham - 1
READ nra(i)
IF nra(i) > nrmax THEN nrmax = nra(i)
NEXT i
PRINT "max number of nurons ="; nrmax

SLEEP

DIM nrout(nrmax) AS INTEGER
DIM nrw(ham, nrmax) AS INTEGER
DIM nrx(nrmax) AS INTEGER

'read in data
DATA 5,5,5,5,5,-5
DATA -4,-4,-4,-4,-4,-4
DATA -4,-4,-4,-4,-4,-4
DATA -4,-4,-4,4,4,4



DATA
DATA
DATA
DATA

'loop


trainrun = 3


FOR runnum = 0 TO trainrun
FOR i = 0 TO nra(0)
READ nrx(i)
PRINT "readin"; nrx(i)
NEXT i
FOR row = 0 TO ham
FOR col = 0 TO nra(row)
nrout(col) = nrw(row, colo) + nrx(col)
IF nrout(col) < 0 THEN nrout(col) = 0
IF nrout(col) > 0 THEN nrout(col) = 1
IF nrout(col) = 0 THEN nrout(col) = zerostate
FOR i = 0 TO nra(col)
nrx(i) = nrx(i) + nrout(col)
NEXT i
IF row = nrmax THEN
IF col = nra(nrmax) THEN
PRINT nrout(0)
nrfo = nrout(0)
END IF
END IF
NEXT col
FOR i = 0 TO nrmax
nrout(i) = 0
NEXT i
NEXT row
NEXT runnum

END

