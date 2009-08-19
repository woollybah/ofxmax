SuperStrict

Import "planet.bmx"

Type Eolienne Extends Displayable

	Field age:Int = 0
	Field h:Int = 30
	Field w:Int = 5
	Field a:Float
	Field aspeed:Float = 4.5

	Method Create:Eolienne(p:Planet, posA:Float)
		Return Eolienne(Super.Create(p, posA))
	End Method

	Method grow()
		age:+ 1
		
		Local gh:Int = h
		Local gh2:Int = h/2
		
		If age < 40 Then
			If age < 10 Then
				gh = Min(age, 10)*h/10
			End If
			gh2 = 0
			If age > 20 Then
				gh2 = (Min(age, 30)-20)*h/20
			End If
		Else
			a :+ aspeed
			If a > 360
				a :- 360
			End If
		End If
		
		ofTriangle(-w/2, 0, w/2, 0, 0, -gh)
		If age > 10 Then
			ofPushMatrix()
			ofTranslate(0, -gh)
			For Local i:Int = 0 Until 3
				ofPushMatrix()
				ofRotateDegrees(a + i * 120)
				ofTriangle(-w/2, 0, w/3, 0, 0, -gh2)
				ofPopMatrix()
			Next
			ofPopMatrix()
		End If
	End Method
	
End Type


