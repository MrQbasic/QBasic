^CLS
DIM filename AS STRING

filename = "c:\data\qbasic\data.dat"

OPEN filename FOR BINARY AS #1
IF LOF(1) = 0 THEN
    CLOSE #1
    OPEN filename FOR OUTPUT AS #1
    WRITE #1, 0
    WRITE #1, 0
    WRITE #1, 0
END IF
CLOSE #1

OPEN filename FOR INPUT AS #1
INPUT #1, x1
INPUT #1, x2
INPUT #1, x3

PRINT x1
PRINT x2
PRINT x3



     

