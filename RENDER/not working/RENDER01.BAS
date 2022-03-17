CLS
SCREEN 12
DIM resu AS INTEGER
DIM size AS INTEGER
DIM keyin AS STRING

size = 10
resu = (30) - 1

SLEEP
DIM hx AS INTEGER
DIM hy AS INTEGER
DIM screenmem(resu, resu) AS INTEGER

DIM sop AS STRING
DIM scol AS INTEGER
DIM sposi1(1) AS INTEGER
DIM sposi2(2) AS INTEGER



sop = "line"
scol = 8
sposi1(0) = 5
sposi1(1) = 5
sposi2(0) = 5
sposi2(1) = 5
GOTO summon
summonback:




DO
keyin = UCASE$(INKEY$)
GOTO render
renderback:
LOOP UNTIL keyin = "#"
END


'-functions-----------------------------
render:
hy = 10
hx = 10
FOR i1 = 0 TO resu
FOR i2 = 0 TO resu
LINE (hy, hx)-(hy + (size - 1), hx + (size - 1)), screenmem(i1, i2), BF
hx = hx + size
NEXT i2
hy = hy + size
hx = 10
NEXT i1
GOTO renderback


summon:
IF sop = "clear" THEN
FOR hx = 0 TO resu
FOR hy = 0 TO resu
screenmem(hx, hy) = scol
NEXT hy
NEXT hx
END IF
IF sop = "line" THEN
IF sposi1(0) = sposi2(0) THEN
FOR hx = sposi1(1) TO sposi2(1)
screenmem(sposi1(0), hx) = scol
NEXT hx
END IF
IF sposi1(1) = sposi2(1) THEN
FOR hx = sposi1(0) TO sposi2(0)
screenmem(hx, sposi1(1)) = scol
NEXT hx
END IF
END IF
GOTO summonback

