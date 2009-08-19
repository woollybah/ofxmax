SuperStrict

Import brl.random
Import "planet.bmx"

Type Building Extends Displayable

	Field age:Int = 0
	Field h:Int = 60
	Field w:Int = 30
	Field windows:Int[]

	Method Create:Building(p:Planet, posA:Float)
		Building(Super.Create(p, posA))
		
		windows = New Int[9]
		For Local i:Int = 0 Until windows.length
			If Rand(0, 2) > 1 Then
				windows[i] = True
			End If
		Next
		
		h = 30 + Rand(0, 30)
		w = 20 + Rand(0, 10)
		
		Return Self
	End Method

	Method grow()
		age:+ 1
		
		Local gh:Int = h
		Local gh2:Int = 5
		
		If age < 40 Then
			If age < 10 Then
				gh = Min(age, 10)*h/10
			End If
			
			If age < 20 Then
				gh2 = 0
			End If
		End If 
		
		ofRect(-w/2, h/10, w, -gh)
		ofSetColor(255, 255, 255)
		Local dw:Int = w/7
		Local dh:Int = -gh/7
		For Local i:Int = 0 Until windows.length
			Local x:Int = i Mod 3
			Local y:Int = i/3
			If windows[i] Then
				ofRect(-w*0.5 + dw + x*2*dw, 1.5*dh + y*2*dh, gh2, gh2)
			End If
		Next
		ofSetColor(0, 0, 0)
	End Method
	
End Type


