CLS
DIM keyin AS STRING
start:
INPUT "numin", in

FOR i = 0 TO in STEP 2
        keyin = UCASE$(INKEY$)
        IF (keyin = "#") THEN END
        IF (keyin = "0") THEN GOTO start
        IF (i = in) THEN GOTO even
NEXT i

PRINT "odd"
GOTO new
even:
PRINT "even"
new:
PRINT "ok"
GOTO start

