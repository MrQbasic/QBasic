SCREEN 12
DIM keyin AS STRING
DIM sh AS INTEGER
DIM sw AS INTEGER
sh = 50
sw = 50
DIM sm(sw * sh) AS INTEGER
DIM iter AS INTEGER
DIM sca(1) AS DOUBLE
DIM h(1) AS DOUBLE

sca(0) = sw
sca(1) = sh


DIM p(1, 1) AS INTEGER
DIM f(1, 1) AS INTEGER
p(0, 0) = 0
p(0, 1) = 0
p(1, 0) = sw
p(1, 1) = sh
f(0, 0) = -2
f(0, 1) = -1
f(1, 0) = 1
f(1, 1) = 1


DIM sc(1) AS DOUBLE
DIM po(1) AS DOUBLE
DIM oy AS INTEGER
DIM rs AS INTEGER
DIM cr AS DOUBLE
DIM ci AS DOUBLE
DIM zr AS DOUBLE
DIM zi AS DOUBLE
DIM re AS DOUBLE
DIM im AS DOUBLE



DO
WHILE keyin = ""
keyin = INKEY$
IF keyin = "o" THEN iter = iter + 1
IF keyin = "p" THEN iter = iter - 1
IF iter < 1 THEN iter = 1
CLS : PRINT iter
WEND


'---------






sc(0) = (f(1, 0) - f(0, 0)) / (p(1, 0) - p(0, 0))
sc(1) = (f(1, 1) - f(0, 1)) / (p(1, 1) - p(0, 1))
po(0) = f(0, 0)
po(1) = f(0, 1)
oy = 0
rs = sw
cr = 0
ci = 0
zr = 0
zi = 0
re = 0
im = 0
FOR y = p(0, 1) TO p(1, 1)
po(0) = f(0, 0)
ci = po(1)
FOR x = p(0, 0) TO p(1, 0)
cr = po(0)
zr = 0
zi = 0
n = 0
WHILE (zr * zr + zi * zi) < 4 AND n < iter
re = zr * zr - zi * zi - cr
im = zr * zi * 2 + ci
zi = im
n = n + 1
WEND
'sm(oy + x) = n
po(0) = sc(0)
NEXT x
po(1) = po(1) + sc(1)
oy = oy + rs
NEXT y
'---------
FOR y = 0 TO sh
FOR x = 0 TO sw
PSET (x, y), 34
NEXT x
NEXT y
'---------
LOOP UNTIL keyin = "#"

