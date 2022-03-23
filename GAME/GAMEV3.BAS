'0 = default
'1 = 1 damage
'2 =
'3 = finish
'4 = insta kill
'5 = bots up down
'6 = bots right left
'7
'8
'9
'10 = spawn

CLS
SCREEN 13

DIM copy AS INTEGER
DIM copy1 AS INTEGER

DIM hdx AS INTEGER
DIM hdy AS INTEGER
DIM hl AS INTEGER

DIM keyin AS STRING

DIM gppx AS INTEGER
DIM gppy AS INTEGER

DIM gbpx AS INTEGER
DIM gbpy AS INTEGER
DIM gbd AS INTEGER

DIM gpoints AS INTEGER
DIM gl AS INTEGER

DIM gp(9, 9) AS INTEGER
DIM gm(9, 9) AS INTEGER
DIM gb(12, 12) AS INTEGER

gl = 5
init:
              
'level 1
DATA 1,1,1,1,1,1,1,1,1,1
DATA 1,10,0,0,1,1,0,0,1,1
DATA 1,0,0,0,1,1,0,1,0,1
DATA 1,0,0,0,1,1,1,0,0,1
DATA 1,0,0,0,1,1,1,1,1,1
DATA 1,0,0,0,1,1,1,1,1,1
DATA 1,0,0,0,1,1,1,0,0,1
DATA 1,0,3,0,1,1,0,1,0,1
DATA 1,0,0,0,1,1,0,0,1,1
DATA 1,1,1,1,1,1,1,1,1,1

'level 2
DATA 0,0,0,4,0,0,0,4,10,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 0,4,0,4,0,4,0,4,0,4
DATA 3,4,0,0,0,4,0,0,0,4

'level 3
DATA 1,1,1,1,1,1,1,1,1,1
DATA 1,0,0,0,1,0,0,0,1,1
DATA 1,0,0,0,1,0,0,0,0,1
DATA 1,0,0,0,1,0,0,0,0,1
DATA 1,0,0,0,1,0,0,0,0,1
DATA 1,0,0,0,1,0,10,0,0,1
DATA 1,0,0,0,1,0,0,0,0,1
DATA 1,0,3,0,1,0,0,0,0,1
DATA 1,0,0,0,1,0,0,0,1,1
DATA 1,1,1,1,1,1,1,1,1,1

'level  4
DATA 1,1,1,1,1,1,1,1,1,1
DATA 1,0,0,6,0,0,0,0,1,1
DATA 1,0,0,0,0,0,0,1,0,1
DATA 1,0,0,0,0,0,0,0,0,1
DATA 1,0,0,0,0,0,0,1,0,1
DATA 1,0,0,0,0,0,0,1,0,1
DATA 1,0,0,0,0,0,1,0,0,1
DATA 1,0,3,0,0,0,1,0,0,1
DATA 1,0,0,0,0,0,1,0,10,1
DATA 1,1,1,1,1,1,1,1,1,1

'get map
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
READ gm(i1, i2)
copy = gm(i1, i2)
IF (copy = 10) THEN
gppy = i1
gppx = i2
END IF
NEXT i2
NEXT i1

'get bots
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
copy = gm(i1, i2)
IF (copy = 5) THEN
gbpx = i1
gbpy = i2
gbd = 1
END IF
IF (copy = 6) THEN
gbpx = i1
gbpy = i2
gbd = 3
END IF
NEXT i2
NEXT i1

hdx = 38
hdy = 38
LINE (hdx, hdy)-(139, 119), 1, BF

redraw:

'keyin
keyin:
keyin = UCASE$(INKEY$)
IF (keyin = "W") THEN gppy = gppy - 1
IF (keyin = "S") THEN gppy = gppy + 1
IF (keyin = "D") THEN gppx = gppx + 1
IF (keyin = "A") THEN gppx = gppx - 1
IF (keyin = "") THEN GOTO keyin
IF (gppx = -1) THEN gppx = gppx + 1
IF (gppx = 10) THEN gppx = gppx - 1
IF (gppy = -1) THEN gppy = gppy + 1
IF (gppy = 10) THEN gppy = gppy - 1

'player position
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
        gp(i1, i2) = 0
NEXT i2
NEXT i1
gp(gppy, gppx) = 1


'bot move

FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
        gb(i1, i2) = 0
NEXT i2
NEXT i1

IF (gbd = 1) THEN
gbpx = gbpx + 1
IF (gbpx = 10) THEN gbd = 2
gb(gbpy, gbpx) = 1
END IF
IF (gbd = 2) THEN
gbpx = gbpx - 1
IF (gbpx = 0) THEN gbd = 1
gb(gbpy, gbpx) = 1
END IF
IF (gbd = 3) THEN
gbpy = gbpy + 1
IF (gbpy = 10) THEN gbd = 4
gb(gbpy, gbpx) = 1
END IF
IF (gbd = 4) THEN
gbpy = gbpy - 1
IF (gbpy = 0) THEN gbd = 3
gb(gbpy, gbpx) = 1
END IF

'render map
hdx = 39
hdy = 39
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
copy = gm(i1, i2)
c = 2
IF (copy = 1) THEN c = 4
IF (copy = 2) THEN c = 7
IF (copy = 3) THEN c = 8
IF (copy = 4) THEN c = 9
LINE (hdx, hdy)-((hdx + 9), (hdy + 7)), c, BF
hdx = hdx + 10
NEXT i2
hdy = hdy + 8
hdx = 39
NEXT i1


'render bot
hdx = 39
hdy = 39
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
copy = gb(i1, i2)
IF (copy = 1) THEN
LINE (hdx, hdy)-((hdx + 9), (hdy + 7)), 12, BF
END IF
hdx = hdx + 10
NEXT i2
hdy = hdy + 8
hdx = 39
NEXT i1


'render player
hdx = 39
hdy = 39
FOR i1 = 0 TO 9
FOR i2 = 0 TO 9
copy = gp(i1, i2)
IF (copy = 1) THEN
LINE (hdx, hdy)-((hdx + 9), (hdy + 7)), 5, BF
END IF
hdx = hdx + 10
NEXT i2
hdy = hdy + 8
hdx = 39
NEXT i1
      
'game rules

copy = gm(gppy, gppx)
copy1 = gb(gppy, gbpx)
IF (copy = 1) THEN gl = gl - 1
IF (copy = 3) THEN GOTO new
IF (copy = 4) THEN gl = 0

IF (gppx = gbpx) THEN
IF (gppy = gbpy) THEN gl = gl - 1
END IF

'game sidebar
LINE (170, 50)-(180, 100), 0, BF
hl = 51
FOR i = 1 TO gl
LINE (173, hl)-(177, (hl + 8)), 2, BF
hl = hl + 10
NEXT i

IF (gl = 0) THEN END
IF (keyin = "#") THEN END
IF (keyin = "P") THEN GOTO init

GOTO redraw

new:                
gppx = 0
gppy = 0
gpoints = gl
gl = 5
GOTO init

