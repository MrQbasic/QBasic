CLS
SCREEN 13
PRINT "press to start"
SLEEP
PRINT "init start"

DIM keyin AS STRING
DIM copy AS INTEGER
DIM gameppy AS INTEGER
DIM gameppx AS INTEGER
DIM gamefx AS INTEGER
DIM gamefy AS INTEGER

gamefy = 5
gamefx = 5
PRINT "gamefield"; gamefx; "x"; gamefy

DIM gamef((gamefx - 1), (gamefy - 1))

DATA 0,0,0,0,0    
DATA 0,0,0,0,0
DATA 0,0,5,0,0
DATA 0,0,0,0,0
DATA 0,0,0,0,0

FOR i1 = 1 TO gamefy
FOR i2 = 1 TO gamefx
READ copy
PRINT copy;
gamef((i1 - 1), (i2 - 1)) = copy
NEXT i2
PRINT ""
NEXT i1


PRINT "init done"
DO

LOOP UNTIL keyin = "#"
PRINT "end"

