SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 1024, 768, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field counter:Float
	Field spin:Float
	Field spinPct:Float
	Field prevMX:Int
	Field prevMY:Int
	Field firstMouseMove:Int

	Method setup()

		counter = 0.0
		spin	= 0.0
		spinPct	= 0.0
		'MouseX  = 263
		'MouseY  = 267
		firstMouseMove = True

		' set background To black
		ofBackground(0, 0, 0)

		' lets make our circles look a little nicer!
		ofSetCircleResolution(40)

		' For smooth animation, set vertical sync If we can
		ofSetVerticalSync(True)

		' also, frame rate:
		ofSetFrameRate(60)

	End Method
	
	Method update()

		'add 1.661 to our counter
		counter :+ 1.661
	
		'reduce the spinPct by a small amount
		'so that the spinning eventually stops
		spinPct	:* 0.99
	
		'update the spin -which is storing the
		'total rotation- by spinPct
		spin :+ spinPct




		' ----------------------------------------
		' TODO : THIS SECTION BELONGS IN mouseMoved() method
		Local mx:Int = MouseX()
		Local my:Int = MouseY()

		' update spinPct by the distance the mouse
		' moved in x and y. We use abs so it always
		' spins in the same direction
	
		'  we use the "bFirstMouseMove" flag so that we calculate only
		'  after we have the first prevMY and prevMX stored
	
		if not firstMouseMove then
			spinPct :+ abs( my - prevMY ) * 0.03
			spinPct :+ abs( mx - prevMX ) * 0.03
		else
			firstMouseMove = false
			' turn the flag off
		end if
	
		' store the x and y
		' so we can get the prev value
		' next time the mouse is moved
		prevMY = my
		prevMX = mx

		' ----------------------------------------


		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
	
		Local mx:Int = MouseX()
		Local my:Int = MouseY()

		' Lets enable blending!
		' We are going to use a blend mode that adds
		' all the colors to white.
		ofEnableAlphaBlending()
		glBlendFunc(GL_SRC_COLOR, GL_ONE)
	
	
		' ---------------------------------
		' RGB CICRLES
	
		' We only want to rotate the circles
		' So we use push and pop matrix to
		' make sure the rotation is contained
		glPushMatrix()
			' we position the rotation point
			' at the location we want it to
			' spin around .
			glTranslatef(750, 320, 0)
			glRotatef(spin, 0, 0, 1)
	
			' draw a red circle
			ofSetColor(255,0, 0)
			ofCircle(-50, -25, 100)
	
			' draw a green circle
			ofSetColor(0,255, 0)
			ofCircle(50, -25, 100)
	
			' draw a blue circle
			ofSetColor(0, 0, 255)
			ofCircle(0, 57, 100)
		glPopMatrix()
	
	
		' ---------------------------------
		' PIXEL OCEAN
	
		' Lets make some 8bit looking waves
		' out of rectangles
		ofSetColor(0, 90, 170)
		Local k:Float = 0.0
		For Local i:Int = 0 Until ofGetWidth() Step 50
	
			' Lets get a unique height for our 'wave'
			' using sine
			Local height:Float = Sin( counter + k)
	
			' sine produces -1 to 1 values
			' lets add 1 to make sure the height
			' is always positive
			height :+ 1.0
	
			' Now it is going from 0 to 2
			' but we want it to be taller than that.
			' Lets make it go from 0 - 100 by
			' multiplying 50
			height :* 50
	
			' lets draw it!
			ofRect(i, ofGetHeight(), 50, -height)
	
			' this variable makes sure that each
			' rect has a unique height otherwise
			' they would all be moving up and down
			' at the same time
			k :+ 40.1
		Next
	
		' This is doing it again but for a different color
		ofSetColor(0, 120, 190)
		k = 0
		For Local i:Int = 0 Until ofGetWidth() Step 50
			ofRect(i+5, ofGetHeight(), 50, -50 * (Sin(1.4 * counter-k)+1.0))
			k :+ 22.9
		Next
	
		' Lets stop the blending!
		ofDisableAlphaBlending()
	
	
		' ---------------------------------
		' LISSAJOUS EXAMPLE
		' http:' en.wikipedia.org/wiki/Lissajous_curve
	
	
		Local x:Float = 0
		Local y:Float = 0
	
		ofSetColor(255, 255, 255)
		' Lets make the curves out of a series
		' of points
		For Local i:Int = 0 Until 800
	
			' Lets use the mouse x and y position
			' to affect the x and y paramters of
			' the curve. These values are quite
			' large, so we scale them down by 0.0001
			Local xPct:Float = (i * mx) * 0.0057
			Local yPct:Float = (i * my) * 0.0057
	
			' lets also use the spin from the
			' rgb circles to transform the curve
			' over time
			xPct :+ spin * 0.114
			yPct :+ spin * 0.171
	
			' Lets feed these two values to
			' sin and cos functions and multiply
			' by how large we want it to be.
			' Because the sin function is producing
			' -1 to 1 results the total width in
			' this case will be double what we
			' specify. So 400 by 300.
			x =  200.0  * Sin(xPct)
			y =  150.0  * Cos(yPct)
	
			' We add the position we want them to be osicalting around
			' and draw the rects as small 2 pixel by 2 pixel squares
			ofRect(300 + x, 320 + y, 2, 2)
		Next
	
		' ---------------------------
		'  use the bitMap type
		'  note, this can be slow on some graphics cards
		'  because it is using glDrawPixels which varies in
		'  speed from system to system.  try using ofTrueTypeFont
		'  if this bitMap type slows you down.
		ofSetColorHex($FFFFFF)
		ofDrawBitmapString("this is a Lissajous curve", 190, 500)
		ofDrawBitmapString("move mouse to spin me", 670, 500)
	
		' ---------------------------
		'  a bunch of lines
		For Local i:Int = 0 Until 20
	
			' Lets make a cheesy sunset
			ofSetColor(255-i*10, 255-i*20, 0)
	
			ofLine(0,  i*4 , ofGetWidth(), i*4)
		Next


	End Method

End Type

