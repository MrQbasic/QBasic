SCREEN 12
CLS

DIM keyin AS STRING
DIM pz(1) AS INTEGER
DIM po(1) AS INTEGER
's: 0=x 1=y 2=z
DIM so(2) AS INTEGER

so(0) = 100: so(1) = 50
pzs(0) = 50: pzs(1) = 50


DO
keyin = UCASE$(INKEY$)
IF keyin = "W" THEN CLS : po(1) = po(1) - 10
IF keyin = "S" THEN CLS : po(1) = po(1) + 10
IF keyin = "A" THEN CLS : po(0) = po(0) - 10
IF keyin = "D" THEN CLS : po(0) = po(0) + 10
IF keyin = "P" THEN CLS : so(2) = so(2) + 10
IF keyin = "O" THEN CLS : so(2) = so(2) - 10
IF keyin = "I" THEN CLS : so(1) = so(1) - 10
IF keyin = "K" THEN CLS : so(1) = so(1) + 10
IF keyin = "J" THEN CLS : so(0) = so(0) - 10
IF keyin = "L" THEN CLS : so(0) = so(0) + 10

pz(0) = po(0) - so(2)
pz(1) = po(1) - so(2)

LINE (pz(0), pz(1))-(pz(0) + so(0), pz(1) + so(1)), 1, B
LINE (po(0), po(1))-(po(0) + so(0), po(1) + so(1)), 1, B

LINE (po(0), po(1))-(pz(0), pz(1)), 3
LINE (po(0) + so(0), po(1))-(pz(0) + so(0), pz(1)), 3
LINE (po(0), po(1) + so(1))-(pz(0), pz(1) + so(1)), 3
LINE (po(0) + so(0), po(1) + so(1))-(pz(0) + so(0), pz(1) + so(1)), 3
                                     
LOOP UNTIL keyin = "#"
END


