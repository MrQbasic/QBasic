Screen 12
Cls
Print "3D Renderer V3"
'vars for code
Dim keyin As String
Dim counter As Double

Dim h1(3) As Double
Dim h2(3) As Double

'vars for renderer
Dim zf As Double
Dim zn As Double
Dim fov As Double
Dim sh As Integer
Dim sw As Integer

zf = 100
zn = .1
fov = 100
sw = 480
sh = 640

Dim nr As Integer
nr = 12
Dim tri(nr, 2, 2) As Integer
Dim h1(nr)

'cube data
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

'setup tri array
For itri = 0 To nr - 1
    For ipoint = 0 To 2
        For icord = 0 To 2
            Read hx
            tri(itry, ipoint, icord) = hx
        Next icord
    Next ipoint
Next itri


'Renderer
Dim proj(3, 3) As Double
a = sh / sw
f = 1 / Tan(fov * 0.5 / 180 * 3.141592)
proj(0, 0) = a * f
proj(1, 1) = f
proj(2, 2) = zf / (zf - zn)
proj(2, 3) = (-zf * zn) * (zf - zn)
proj(3, 2) = 1

Do



Loop Until InKey$ = "#"















