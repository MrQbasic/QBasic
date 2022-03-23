SCREEN 12
CLS
DIM rendermap(9, 9) AS INTEGER
DIM hlx AS INTEGER
DIM hly AS INTEGER
DIM size AS INTEGER
size = 20

DATA 1,1,1,1,1,1,1,1,1,1
DATA 1,1,0,0,0,0,0,0,1,1
DATA 1,0,1,0,0,0,0,1,0,1
DATA 1,0,0,1,0,0,1,0,0,1
DATA 1,0,0,0,1,1,0,0,0,1
DATA 1,0,0,0,1,1,0,0,0,1
DATA 1,0,0,1,0,0,1,0,0,1
DATA 1,0,1,0,0,0,0,1,0,1
DATA 1,1,0,0,0,0,0,0,1,1
DATA 1,1,1,1,1,1,1,1,1,1

newrender:
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
READ rendermap(i1, i2)
NEXT i2
NEXT i1

newdraw:
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
copy = rendermap(i1, i2)
IF copy = 1 THEN LINE (hlx, hly)-(hlx + size, hly + size), 1, BF
hlx = hlx + (size + 1)
NEXT i2
hlx = 0
hly = hly + (size + 1)
NEXT i1



