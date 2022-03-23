DIM notes(7) AS STRING
DIM laenge AS INTEGER
notes(1) = "T120C8"
notes(2) = "T120D8"
notes(3) = "T120E8"
notes(4) = "T120F8"
notes(5) = "T120G8"
notes(6) = "T120A8"
notes(7) = "T120<<C8"
DIM x AS INTEGER
DIM y AS INTEGER
10
CLS
PRINT "111 zum beenden"
INPUT "wie viele noten", laenge
FOR x = 0 TO laenge
   y = INT(RND * 7) + 1
   PLAY notes(y)
   PRINT (y); (notes(y))
  
   IF y = 7 THEN PLAY ">>"
   IF laenge = 111 THEN PRINT "ok"; : GOTO 20
NEXT x
GOTO 10
20 STOP

