CLS
SCREEN 12
PRINT "init"

DIM h1 AS INTEGER
DIM keyin AS STRING
DIM keyin2 AS STRING
DIM irnd AS INTEGER

DIM ginvsize AS INTEGER
ginvsize = 5
DIM ginv(ginvsize, 2) AS INTEGER
DIM gpp(1) AS INTEGER
DIM gwb AS INTEGER
gwb = 30
DIM gm(gwb, gwb) AS INTEGER
DIM giid(10) AS STRING

DIM gitc AS INTEGER
gitc = 10
DIM gc(gitc, ginvsize + 1, 1) AS INTEGER

giid(0) = "Nothing"
giid(1) = "Dirt"
giid(2) = "Stone"
giid(3) = "Sand"
giid(4) = "Iron"
giid(5) = "Dia"
giid(6) = "Tree"
giid(7) = "Wood"
giid(8) = "Axe"

FOR i1 = 0 TO gwb
FOR i2 = 0 TO gwb
gm(i1, i2) = 99
NEXT i2
NEXT i1

FOR i1 = 0 TO gitc
FOR i2 = 0 TO ginvsize + 1
gc(i1, i2, 0) = 99
NEXT i2
NEXT i1

gc(0, 0, 0) = 8
gc(0, 0, 1) = 1
gc(0, 1, 0) = 7
gc(0, 1, 1) = 4
gc(0, 2, 0) = 2
gc(0, 2, 1) = 4

PRINT "init done"

PRINT "---------------"
PRINT "W-A-S-D to move"
PRINT "pick up"
PRINT "items"
PRINT "craft"
PRINT "new map"
PRINT "---------------"
PRINT ""

DO
INPUT "input: ", keyin
keyin = UCASE$(keyin)
IF keyin <> "" THEN
h1 = 0
IF keyin = "EXIT" THEN GOTO skipp2
IF keyin = "#" THEN GOTO skipp2
IF keyin = "W" THEN gpp(1) = gpp(1) - 1
IF keyin = "S" THEN gpp(1) = gpp(1) + 1
IF keyin = "A" THEN gpp(0) = gpp(0) - 1
IF keyin = "D" THEN gpp(0) = gpp(0) + 1
IF gpp(1) > gwb THEN gpp(1) = gpp(1) - 1
IF gpp(0) > gwb THEN gpp(0) = gpp(0) - 1
IF gpp(1) < 0 THEN gpp(1) = gpp(1) + 1
IF gpp(0) < 0 THEN gpp(0) = gpp(0) + 1
PRINT "         position:"; "x"; gpp(0), "y"; gpp(1)

IF gm(gpp(0), gpp(1)) = 99 THEN
irnd = INT(RND * 100) + 1
IF irnd < 101 THEN gm(gpp(0), gpp(1)) = 1
IF irnd < 70 THEN gm(gpp(0), gpp(1)) = 2
IF irnd < 45 THEN gm(gpp(0), gpp(1)) = 6
IF irnd < 20 THEN gm(gpp(0), gpp(1)) = 3
IF irnd < 10 THEN gm(gpp(0), gpp(1)) = 4
IF irnd < 3 THEN gm(gpp(0), gpp(1)) = 5
PRINT "         "; giid(gm(gpp(0), gpp(1))); " found"
GOTO skipp1
END IF
PRINT "         You are on: "; giid(gm(gpp(0), gpp(1)))
skipp1:

LINE (400, 0)-(560, 220), 0, BF

IF keyin = "PICK UP" THEN
IF gm(gpp(0), gpp(1)) = 0 THEN
PRINT "You Can not pick up Nothing"
GOTO skipp2
END IF
IF gm(gpp(0), gpp(1)) = 6 THEN gm(gpp(0), gpp(1)) = 7
FOR i = 0 TO ginvsize
IF ginv(i, 0) = gm(gpp(0), gpp(1)) THEN
ginv(i, 1) = ginv(i, 1) + 1
GOTO skipp3
END IF
NEXT i
FOR i = 0 TO ginvsize
IF ginv(i, 0) = 0 THEN
IF gm(gpp(0), gpp(1)) <> 0 THEN
ginv(i, 0) = gm(gpp(0), gpp(1))
ginv(i, 1) = 1
GOTO skipp3
END IF
END IF
NEXT i
PRINT "         No Space"
skipp3:
gm(gpp(0), gpp(1)) = 0
END IF

IF keyin = "ITEMS" THEN
FOR i = 0 TO ginvsize
PRINT "         Slot:"; i; giid(ginv(i, 0)); " x"; ginv(i, 1)
NEXT i
END IF

IF keyin = "CRAFT" THEN
CLS
PRINT "crafting menu"
FOR i1 = 0 TO gitc
IF gc(i1, 0, 0) = 99 THEN GOTO skipp4
PRINT i1, giid(gc(i1, 0, 0)); "  x"; gc(i1, 0, 1); " :"
FOR i2 = 0 TO ginvsize
IF gc(i1, i2 + 1, 0) = 99 THEN GOTO skipp5
PRINT giid(gc(i1, i2 + 1, 0)); "  x"; gc(i1, i2 + 1, 1)
skipp5:
NEXT i2
PRINT ""
NEXT i1
skipp4:
DO
INPUT "what to do ?", keyin2
keyin2 = UCASE$(keyin2)
IF STR$(VAL(keyin2)) <> "0" THEN
IF VAL(keyin2) < gitc + 1 THEN
IF gc(VAL(keyin2), 0, 0) = 99 THEN PRINT "cant craf Nothig"
IF gc(VAL(keyin2), 0, 0) <> 99 THEN
for


END IF
END IF
END IF


LOOP UNTIL keyin2 = "EXIT"
CLS
END IF

IF keyin = "NEW MAP" THEN
FOR i1 = 0 TO gwb
FOR i2 = 0 TO gwb
gm(i1, i2) = 99
NEXT i2
NEXT i1
END IF

skipp6:
x1 = 0
x2 = 0
FOR i1 = 0 TO 120 STEP 5
FOR i2 = 0 TO 120 STEP 5
LINE (400 + i2, 100 + i1)-(400 + i2 + 4, 100 + i1 + 4), gm(x1, x2), BF
x1 = x1 + 1
NEXT i2
x1 = 0
x2 = x2 + 1
NEXT i1

skipp2:
END IF
LOOP UNTIL keyin = "EXIT"
END

