CLS
DIM keyin AS STRING
DIM counter AS DOUBLE
DIM hx AS DOUBLE
DIM hy AS DOUBLE
DIM hz AS DOUBLE
DIM sch AS INTEGER
DIM scw AS INTEGER
DIM a  AS DOUBLE
DIM zf AS INTEGER
DIM zn AS INTEGER
DIM zo1 AS DOUBLE
DIM zo2 AS DOUBLE
DIM fov AS DOUBLE
DIM f AS DOUBLE
zf = 100
zr = .1
fov = 90
sch = 480
scw = 640
DIM nrot AS INTEGER
nrot = 12
DIM try(nrot, 2, 2) AS DOUBLE
DIM tryo(nrot, 2, 2) AS DOUBLE
DIM tryoo(nrot, 2, 1) AS DOUBLE
DIM rotz(3, 3) AS DOUBLE
DIM rotx(3, 3) AS DOUBLE
DIM rot(3, 3) AS DOUBLE
DIM proj(3, 3) AS DOUBLE
DIM hm(3) AS DOUBLE
DATA 0,0,0, 0,1,0, 1,1,0
DATA 0,0,0, 1,1,0, 1,0,0
DATA 1,0,0, 1,1,0, 1,1,1
DATA 1,0,0, 1,1,1, 1,0,1
DATA 1,0,1, 1,1,1, 0,1,1
DATA 1,0,1, 0,1,1, 0,0,1
DATA 0,0,1, 0,1,1, 0,1,0
DATA 0,0,1, 0,1,0, 0,0,0
DATA 0,1,0, 0,1,1, 1,1,1
DATA 0,1,0, 1,1,1, 1,1,0
DATA 1,0,1, 0,0,1, 0,0,0
DATA 1,0,1, 0,0,0, 1,0,0
FOR itry = 0 TO nrot - 1
FOR ipoint = 0 TO 2
FOR icord = 0 TO 2
PRINT "try :"; itry, "point"; ipoint, "cord"; icord
READ hx
PRINT hx;
try(itry, ipoint, icord) = hx + 3
NEXT icord
NEXT ipoint
NEXT itry
'----one time-----
a = sch / scw
f = 1 / TAN(fov * .5 / 180 * 3.14159)
proj(0, 0) = a * f
proj(1, 1) = f
proj(2, 2) = zf / (zf - zn)
proj(2, 3) = (-zf * zn) * (zf - zn)
proj(2, 3) = 1
proj(3, 3) = 0

rotz(2, 2) = 1
rotz(3, 3) = 1
rotx(0, 0) = 1
rotx(3, 3) = 1
PRINT "nrot :"; nrot
PRINT "fov in:"; fov, "fov out:"; f
SLEEP
CLS
SCREEN 12
PAINT (0, 0), 1
'----loop-----
FOR counter = 0 TO 100 STEP 1
keyin = UCASE$(INKEY$)
IF keyin = "#" THEN END
FOR itry = 0 TO 11
FOR ipoint = 0 TO 2

rotz(0, 0) = COS(counter)
rotz(0, 1) = SIN(counter)
rotz(1, 0) = -SIN(counter)
rotr(1, 1) = COS(counter)
rotx(1, 1) = COS(counter * .5)
rotx(1, 2) = SIN(counter * .5)
rotx(2, 1) = -SIN(counter * .5)
rotx(2, 2) = COS(couter)

hm(0) = try(itry, ipoint, 0)
hm(1) = try(itry, ipoint, 1)
hm(2) = try(itry, ipoint, 2)
hm(3) = 1

FOR hx = 0 TO 3
FOR hy = 0 TO 3
hm(hx) = hm(hx) + (rotz(hx, hy) * hm(hx))
NEXT hy
NEXT hx

FOR hx = 0 TO 3
FOR hy = 0 TO 3
hm(hx) = hm(hx) + (rotx(hx, hy) * hm(hx))
NEXT hy
NEXT hx

FOR hx = 0 TO 3
FOR hy = 0 TO 3
hm(hx) = hm(hx) + (proj(hx, hy) * hm(hx))
NEXT hy
NEXT hx


hz = hm(2) / hm(3)
hx = hm(0) / hm(3)
hy = hm(1) / hm(3)
PRINT hm(3);

hx = hx + 1
hy = hy + 1
hx = hx * .5 * scw
hy = hy * .5 * sch


tryo(itry, ipoint, 0) = scw - hx
tryo(itry, ipoint, 1) = sch - hy
NEXT ipoint

LINE (tryo(itry, 0, 0), tryo(itry, 0, 1))-(tryo(itry, 1, 0), tryo(itry, 1, 1)), itry
LINE (tryo(itry, 1, 0), tryo(itry, 1, 1))-(tryo(itry, 2, 0), tryo(itry, 2, 1)), itry
LINE (tryo(itry, 2, 0), tryo(itry, 2, 1))-(tryo(itry, 0, 0), tryo(itry, 0, 1)), itry

FOR hy = 0 TO 2
tryoo(itry, hy, 0) = tryo(itry, hy, 0)
tryoo(itry, hy, 1) = tryo(itry, hy, 1)
NEXT hy
NEXT itry

FOR hx = 0 TO nrot - 1
LINE (tryoo(hx, 0, 0), tryoo(hx, 0, 1))-(tryoo(hx, 1, 0), tryoo(hx, 1, 1)), 1
LINE (tryoo(hx, 1, 0), tryoo(hx, 1, 1))-(tryoo(hx, 2, 0), tryoo(hx, 2, 1)), 1
LINE (tryoo(hx, 2, 0), tryoo(hx, 2, 1))-(tryoo(hx, 0, 0), tryoo(hx, 0, 1)), 1
NEXT hx

NEXT counter
END

