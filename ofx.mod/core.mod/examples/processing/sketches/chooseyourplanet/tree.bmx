SuperStrict

Import BaH.random
Import "planet.bmx"

Type Tree Extends Displayable

	Field age:Int = 0
	Field h:Int

	Method Create:Tree(p:Planet, posA:Float)
		Super.Create(p, posA)
		
		h = 20 + Rand(0, 5)
		Return Self
	End Method

	Method grow()
		age:+ 1
		
		Local gh:Int = Min(age, h)
		Local theta:Float = 90*gh/60
		
		ofLine(0, 0, 0, -gh)
		ofTranslate(0, -gh)
		branch(gh, theta)
	End Method
	
	Method branch(h:Float, theta:Float)
		h :* 0.6
		
		' All recursive functions must have an exit condition!!!!
		' Here, ours is when the length of the branch is 2 pixels or less
		If h > 2 Then
			ofPushMatrix()    ' Save the current state of transformation (i.e. where are we now)
				ofRotateDegrees(theta)   ' Rotate by theta
				ofLine(0,0,0,-h)  ' Draw the branch
				ofTranslate(0,-h) ' Move to the end of the branch
				branch(h, theta)       ' Ok, now call myself to draw two new branches!!
			ofPopMatrix()     ' Whenever we get back here, we "pop" in order to restore the previous matrix state
		
			' Repeat the same thing, only branch off to the "left" this time!
			ofPushMatrix()
				ofRotateDegrees(-theta)
				ofLine(0,0,0,-h)
				ofTranslate(0,-h)
				branch(h, theta)
			ofPopMatrix()
		End If
	End Method
	
End Type



