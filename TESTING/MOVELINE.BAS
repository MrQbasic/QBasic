SCREEN 12
DIM x AS INTEGER
DIM y AS INTEGER
DIM x1 AS INTEGER
DIM y1 AS INTEGER
DIM amp AS INTEGER
DIM keyin AS STRING
DIM colorofline AS INTEGER
y = 240
x = 340
y1 = 240
x1 = 340
INPUT "amplifier", amp
INPUT "color from 0 - 15", colorofline
CLS
DO
keyin = UCASE$(INKEY$)
IF keyin = "W" THEN y = y - (1 * amp)
IF keyin = "S" THEN y = y + (1 * amp)
IF keyin = "D" THEN x = x + (1 * amp)
IF keyin = "A" THEN x = x - (1 * amp)

IF keyin = "I" THEN y1 = y1 - (1 * amp)
IF keyin = "K" THEN y1 = y1 + (1 * amp)
IF keyin = "L" THEN x1 = x1 + (1 * amp)
IF keyin = "J" THEN x1 = x1 - (1 * amp)
IF keyin = "" THEN GOTO skip
CLS
skip:
LINE (x1, y1)-(x, y), colorofline
LOOP UNTIL keyin = "#"

