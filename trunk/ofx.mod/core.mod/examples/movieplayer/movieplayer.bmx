SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d


Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 800, 600, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field fingerMovie:ofVideoPlayer
	Field frameByframe:Int

	Method setup()
		ofBackground(255,255,255)
		
		fingerMovie = New ofVideoPlayer
		fingerMovie.loadMovie("movies/fingers.mov")
		fingerMovie.play()
	End Method
	
	Method update()
		fingerMovie.idleMovie()

		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		ofSetColorHex($FFFFFF)
		fingerMovie.draw(20,20)
		
		ofSetColorHex($000000)
		Local pixels:Byte Ptr = fingerMovie.getPixels()
		' let's move through the "RGB" char array
		' using the red pixel to control the size of a circle.
		For Local i:Int = 4 Until 320 Step 8
			For Local j:Int = 4 Until 240 Step 8
				Local r:Int = pixels[(j * 320 + i)*3]
				Local val:Float = 1 - (r / 255.0)
				ofCircle(400 + i, 20+j, 10*val)
			Next
		Next
		
		ofSetColorHex($000000)
		
		ofDrawBitmapString("press f to change",20,320)
		
		If frameByframe Then
			ofSetColorHex($CCCCCC)
		End If
		
		ofDrawBitmapString("mouse speed position",20,340)
		
		If Not frameByframe Then
			ofSetColorHex($CCCCCC)
		Else
			ofSetColorHex($000000)
		End If
		
		ofDrawBitmapString("keys <- -> frame by frame " ,190,340)
		ofSetColorHex($000000)
		
		ofDrawBitmapString("frame: " + fingerMovie.getCurrentFrame() + "/" + fingerMovie.getTotalNumFrames(), 20, 380)
		ofDrawBitmapString("duration: " + (fingerMovie.getPosition() * fingerMovie.getDuration()) + "/" + fingerMovie.getDuration(), 20, 400)
		ofDrawBitmapString("speed: " + fingerMovie.getSpeed(), 20, 420)
		
		If fingerMovie.getIsMovieDone() Then
			ofSetColorHex($FF0000)
			ofDrawBitmapString("end of movie",20,440)
		End If
	End Method

	Method keyPressed(key:Int)
		Select key
			Case KEY_F
				frameByframe = Not frameByframe
				fingerMovie.setPaused(frameByframe)
			Case KEY_LEFT
				fingerMovie.previousFrame()
			Case KEY_RIGHT
				fingerMovie.nextFrame()
			Case KEY_0
				fingerMovie.firstFrame()
		End Select
	End Method


	Method mousePressed(x:Int, y:Int, button:Int)
		If Not frameByframe Then
			fingerMovie.setPaused(True)
		End If
	End Method

	Method mouseReleased(x:Int, y:Int, button:Int)
		If Not frameByframe Then
			fingerMovie.setPaused(False)
		End If
	End Method
	
	Method mouseMoved(x:Int, y:Int)
		If Not frameByframe Then
			Local width:Int = ofGetWidth()
			Local pct:Float = x / Float(width)
			Local speed:Float = (2 * pct - 1) * 5.0
			fingerMovie.setSpeed(speed)
		End If
	End Method

	Method mouseDragged(x:Int, y:Int, button:Int)
		If Not frameByframe Then
			Local width:Int = ofGetWidth()
			Local pct:Float = x / Float(width)
			fingerMovie.setPosition(pct)
		End If
	End Method
	

End Type

