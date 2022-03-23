CLS
DIM k AS STRING
DIM x AS INTEGER

PRINT "# to exit"
DO
k = INKEY$

IF k = "q" THEN c = c - 1
IF k = "w" THEN c = c + 1
IF c = 256 THEN c = c - 1
IF c = -1 THEN c = c + 1
PRINT c; CHR$(c)


LOOP UNTIL k = "#"

