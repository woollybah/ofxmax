SuperStrict

Import ofx.ofxglmax2d
Import brl.linkedlist

Type Displayable

	Field posA:Float
	Field p:Planet
	
	Method Create:Displayable(p:Planet, posA:Float)
		Self.p = p
		Self.posA = posA
		Return Self
	End Method

	Method display()
		ofPushMatrix()
			ofRotateDegrees(posA)
			ofTranslate(p.halfsize, 0)
			ofPushMatrix()
				ofRotateDegrees(90)
				grow()
			ofPopMatrix()
		ofPopMatrix()
	End Method
	
	Method grow()
	End Method
	
End Type


Type Planet

	Field x:Int, y:Int
	Field a:Float = 0.0
	Const speed:Float = 0.225
	Field halfsize:Int = 80
	Field displayables:TList
	
	Method Create:Planet(x:Int, y:Int)
		Self.x = x
		Self.y = y
		displayables = New TList
		Return Self
	End Method
	
	Method turn()
		a :+ speed
		If a > 360 Then
			a:- 360
		End If
	End Method
	
	Method addObject(d:Displayable)
		displayables.AddLast(d)
	End Method
	
	Method clean()
		displayables.Clear()
	End Method
	
	Method display()
		ofPushMatrix()
		ofTranslate(x, y)
		ofRotateDegrees(a)
		ofSetColorHex(0)
		ofFill()
		ofEllipse(0, 0, halfsize Shl 1, halfsize Shl 1)
		
		For Local d:Displayable = EachIn displayables
			d.display()
		Next
		
		ofPopMatrix()
	End Method
	
End Type
