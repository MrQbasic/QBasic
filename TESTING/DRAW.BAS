DIM x1 AS INTEGER
DIM y1 AS INTEGER
SCREEN 2
DIM i AS INTEGER
INPUT "anzahl", i
FOR x = 1 TO i
RANDOMIZE TIMER
LINE (0, INT(RND * 200))-(640, INT(RND * 200))
NEXT x
SLEEP
CLS
FOR x = 1 TO i
RANDOMIZE TIMER
x1 = INT(RND * 640)
y1 = INT(RND * 200)
CIRCLE (x1, y1), 10, 1
PAINT (x1, y1), 1, 1
NEXT x
SLEEP
CLS
FOR x = 1 TO (i * 5) STEP 5
 LINE (319 - (x * 2), 99 - x)-(320 + (x * 2), 100 + x), 1, B
NEXT x
SLEEP
CLS
CIRCLE (320, 100), 40, 1
LINE (320, 0)-(320, 200), 1
PAINT (330, 100), 1, 1
SLEEP
CLS
LINE (100, 50)-(200, 150), 1, BF
SLEEP
CLS
FOR x = 1 TO i
LINE ((10 + (x * 10)), (100 + x))-((10 + (x * 10)), (100 - x)), 1
NEXT x
SLEEP
CLS
FOR x = 1 TO i
RANDOMIZE TIMER
CIRCLE (INT(RND * 640), INT(RND * 200)), INT(RND * 40), 1
NEXT x
SLEEP
CLS
x1 = 0
y1 = 0
FOR x = 1 TO i
RANDOMIZE TIMER
x1 = INT(RND * 640)
y1 = INT(RND * 200)
CIRCLE (x1, y1), INT(RND * 40), 1
LINE (INT(RND * 640), 0)-(INT(RND * 640), 200), 1
PAINT (x1, y1), 1, 1
NEXT x
SLEEP
CLS
FOR x = 1 TO 640 STEP i + 2
LINE ((640 - x), 0)-(640, 200), 1
NEXT x
SLEEP
CLS
FOR x = 1 TO 640 STEP i
LINE (x, 0)-(640 - x, 200), 1
NEXT x
SLEEP
CLS





