DIM in AS STRING
DIM x AS INTEGER
10
CLS
x = 0
INPUT "Letter in", in
PRINT in;
PRINT ASC(in)
in = ""
INPUT "return ? if not 1", x
IF x = 1 THEN GOTO 20
GOTO 10
20

