SCREEN 13
DIM x(10, 10) AS INTEGER
DIM size AS INTEGER
DIM x1 AS INTEGER
DIM y1 AS INTEGER
DIM num AS INTEGER
PRINT "init start"
INPUT "enter size  ", size
FOR i1 = 0 TO 10
FOR i2 = o TO 10
RANDOMIZE TIMER
num = INT(RND * 250)
x(i1, i2) = num
NEXT i2
NEXT i1
PRINT ; "init done"
FOR i1 = 0 TO 10
FOR i2 = 0 TO 10
LINE (x1, y1)-((x1 + size), (y1 + (size - 1))), x(i1, i2), BF
x1 = x1 + (size + 1)
NEXT i2
y1 = y1 + size
x1 = 0
NEXT i1
SLEEP


