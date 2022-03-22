Cls
Dim keyin As String
Dim counter As Double
Dim sch As Integer
Dim scw As Integer
Dim a As Double
Dim zf As Integer
Dim zn As Integer
Dim zo1 As Double

Dim zo2 As Double
Dim fov As Double
Dim f As Double

zf = 100
zn = .1
fov = 100
sch = 480
scw = 640

Dim nrot As Integer
nrot = 12
Dim il(nrot) As Integer
Dim try(nrot, 2, 2) As Double
Dim tryo(nrot, 2, 2) As Double
Dim tryoo(nrot, 2, 2) As Double
Dim cam(2) As Double
Dim rotz(3, 3) As Double
Dim rotx(3, 3) As Double
Dim rot(3, 3) As Double
Dim proj(3, 3) As Double
Dim hm(3) As Double
Dim ho(3) As Double

Data 0,0,0,0,1,0,1,1,0
Data 0,0,0,1,1,0,1,0,0
Data 1,0,0,1,1,0,1,1,1
Data 1,0,0,1,1,1,1,0,1
Data 1,0,1,1,1,1,0,1,1
Data 1,0,1,0,1,1,0,0,1
Data 0,0,1,0,1,1,0,1,0
Data 0,0,1,0,1,0,0,0,0
Data 0,1,0,0,1,1,1,1,1
Data 0,1,0,1,1,1,1,1,0
Data 1,0,1,0,0,1,0,0,0
Data 1,0,1,0,0,0,1,0,0

For itry = 0 To nrot - 1
    For ipoint = 0 To 2
        For icord = 0 To 2
            Print "try :"; itry, "point"; ipoint, "cord"; icord
            Read hx
            try(itry, ipoint, icord) = hx
        Next icord
    Next ipoint
Next itry

'----one time-----
a = sch / scw
f = 1 / Tan(fov * .5 / 180 * 3.14159)
proj(0, 0) = a * f
proj(1, 1) = f
proj(2, 2) = zf / (zf - zn)
proj(2, 3) = (-zf * zn) * (zf - zn)
proj(3, 2) = 1
proj(3, 3) = 0

Print "nrot :"; nrot
Print "fov in:"; fov, "fov out:"; f
Sleep
Cls
Screen 12

'----loop-----
For counter = 0 To 100 Step .075
    For i = 0 To nrot - 1
        il(i) = 0
    Next i
    keyin = UCase$(InKey$)
    If keyin = "#" Then End
    For itry = 0 To 11
        For ipoint = 0 To 2
            rotz(0, 0) = Cos(counter)
            rotz(0, 1) = Sin(counter)
            rotz(1, 0) = -Sin(counter)
            rotz(1, 1) = Cos(counter)
            rotz(2, 2) = 1
            rotz(3, 3) = 1
            rotx(0, 0) = 1
            rotx(1, 1) = Cos(counter * .5)
            rotx(1, 2) = Sin(counter * .5)
            rotx(2, 1) = -Sin(counter * .5)
            rotx(2, 2) = Cos(counter * .5)
            rotx(3, 3) = 1
            hm(0) = try(itry, ipoint, 0)
            hm(1) = try(itry, ipoint, 1)
            hm(2) = try(itry, ipoint, 2)
            ho(0) = hm(0) * rotz(0, 0) + hm(1) * rotz(1, 0) + hm(2) * rotz(2, 0) + rotz(3, 0)
            ho(1) = hm(0) * rotz(0, 1) + hm(1) * rotz(1, 1) + hm(2) * rotz(2, 1) + rotz(3, 1)
            ho(2) = hm(0) * rotz(0, 2) + hm(1) * rotz(1, 2) + hm(2) * rotz(2, 2) + rotz(3, 2)
            ho(3) = hm(0) * rotz(0, 3) + hm(1) * rotz(1, 3) + hm(2) * rotz(2, 3) + rotz(3, 3)
            If ho(3) <> 0 Then
                ho(0) = ho(0) / ho(3)
                ho(1) = ho(1) / ho(3)
                ho(2) = ho(2) / ho(3)
            End If
            hm(0) = ho(0)
            hm(1) = ho(1)
            hm(2) = ho(2)
            ho(0) = hm(0) * rotx(0, 0) + hm(1) * rotx(1, 0) + hm(2) * rotx(2, 0) + rotx(3, 0)
            ho(1) = hm(0) * rotx(0, 1) + hm(1) * rotx(1, 1) + hm(2) * rotx(2, 1) + rotx(3, 1)
            ho(2) = hm(0) * rotx(0, 2) + hm(1) * rotx(1, 2) + hm(2) * rotx(2, 2) + rotx(3, 2)
            ho(3) = hm(0) * rotx(0, 3) + hm(1) * rotx(1, 3) + hm(2) * rotx(2, 3) + rotx(3, 3)
            If ho(3) <> 0 Then
                tryo(0, ipoint, 0) = ho(0) / ho(3)
                tryo(0, ipoint, 1) = ho(1) / ho(3)
                tryo(0, ipoint, 2) = ho(2) / ho(3)
            End If
        Next ipoint
        normal(1, 0) = tryo(0, 1, 0) - tryo(0, 0, 0)
        normal(1, 1) = tryo(0, 1, 1) - tryo(0, 0, 1)
        normal(1, 2) = tryo(0, 1, 2) - tryo(0, 0, 2)
        normal(2, 0) = tryo(0, 2, 0) - tryo(0, 0, 0)
        normal(2, 1) = tryo(0, 2, 1) - tryo(0, 0, 1)
        normal(2, 2) = tryo(0, 2, 2) - tryo(0, 0, 2)
        normal(0, 0) = normal(1, 1) * normal(2, 2) - normal(1, 2) * normal(2, 1)
        normal(0, 1) = normal(1, 2) * normal(2, 0) - normal(1, 0) * normal(2, 2)
        normal(0, 2) = normal(1, 0) * normal(2, 1) - normal(1, 1) * normal(2, 0)
        tryo(1, 1, 1) = Sqr(normal(0, 0) * normal(0, 0) + normal(0, 1) * normal(0, 1) + normal(0, 2) * normal(0, 2))
        If tryo(1, 1, 1) <> 0 Then
            normal(0, 0) = normal(0, 0) / tryo(1, 1, 1)
            normal(0, 1) = normal(0, 1) / tryo(1, 1, 1)
            normal(0, 2) = normal(0, 2) / tryo(1, 1, 1)
        End If
        tryo(2, 2, 2) = 0
        tryo(2, 2, 2) = tryo(2, 2, 2) + (normal(0, 0) * (tryo(0, 0, 0) - cam(0)))
        tryo(2, 2, 2) = tryo(2, 2, 2) + (normal(0, 1) * (tryo(0, 0, 1) - cam(1)))
        tryo(2, 2, 2) = tryo(2, 2, 2) + (normal(0, 2) * (tryo(0, 0, 2) - cam(2)))

        For ipoint = 0 To 2
            hm(0) = tryo(0, ipoint, 0)
            hm(1) = tryo(0, ipoint, 1)
            hm(2) = tryo(0, ipoint, 2)
            ho(0) = hm(0) * proj(0, 0) + hm(1) * proj(1, 0) + hm(2) * proj(2, 0) + proj(3, 0)
            ho(1) = hm(0) * proj(0, 1) + hm(1) * proj(1, 1) + hm(2) * proj(2, 1) + proj(3, 1)
            ho(2) = hm(0) * proj(0, 2) + hm(1) * proj(1, 2) + hm(2) * proj(2, 2) + proj(3, 2)
            ho(3) = hm(0) * proj(0, 3) + hm(1) * proj(1, 3) + hm(2) * proj(2, 3) + proj(3, 3)
            If ho(3) <> 0 Then
                ho(0) = ho(0) / ho(3)
                ho(1) = ho(1) / ho(3)
                ho(2) = ho(2) / ho(3)
            End If
            hm(0) = ho(0)
            hm(1) = ho(1)
            hm(2) = ho(2)
            ho(0) = hm(0) + 1
            ho(1) = hm(1) + 1
            hm(0) = ho(0) * .5 * scw
            hm(1) = ho(1) * .5 * sch
            tryoo(itry, ipoint, 0) = scw - hm(0)
            tryoo(itry, ipoint, 1) = sch - hm(1)
        Next ipoint
        skipp:
    Next itry
    Cls
    For i = 0 To nrot - 1
        Line (tryoo(i, 0, 0), tryoo(i, 0, 1))-(tryoo(i, 1, 0), tryoo(i, 1, 1)), 15
        Line (tryoo(i, 1, 0), tryoo(i, 1, 1))-(tryoo(i, 2, 0), tryoo(i, 2, 1)), 15
        Line (tryoo(i, 2, 0), tryoo(i, 2, 1))-(tryoo(i, 0, 0), tryoo(i, 0, 1)), 15
    Next i
    start = Timer
    Do
    Loop Until (Timer - start) >= 0.01
Next counter
End


