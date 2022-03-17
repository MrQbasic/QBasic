SCREEN 12

DIM nofp AS INTEGER
nofp = 7

DIM points(nofp, 2) AS INTEGER

DIM x1 AS INTEGER
DIM x2 AS INTEGER
DIM x3 AS INTEGER

DATA 100,100,100
DATA 100,200,100
DATA 200,200,100
DATA 200,100,100

DATA 125,125,100
DATA 125,175,100
DATA 175,125,100
DATA 175,175,100

FOR i = 0 TO nofp
READ x1
READ x2
READ x3
points(i, 0) = x1
points(i, 1) = x2
points(i, 2) = x3
NEXT i


FOR i1 = 0 TO nofp
FOR i2 = 0 TO nofp
       LINE (points(i1, 0), points(i1, 1))-(points(i2, 0), points(i2, 1)), 1
NEXT i2
NEXT i1

