SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d

'
'DebugStop
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 800, 600, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field fftSmoothed:Float Ptr
	Field px:Float, py:Float, vx:Float, vy:Float

	Field bandsToGet:Int
	Field prevx:Float
	Field prevy:Float

	Field beat:ofSoundPlayer
	Field ow:ofSoundPlayer
	Field dog:ofSoundPlayer
	Field rooster:ofSoundPlayer

		
	Method setup()
		beat = New ofSoundPlayer
		ow = New ofSoundPlayer
		dog = New ofSoundPlayer
		rooster = New ofSoundPlayer

		' load in sounds:
		beat.LoadSound("data/sounds/jdee_beat.mp3")
		ow.LoadSound("data/sounds/ow.mp3")	
		dog.LoadSound("data/sounds/dog.mp3")	
		rooster.LoadSound("data/sounds/rooster.mp3")
		
		' we will bounce a circle using these variables:
		px = 300
		py = 300
		vx = 20
		vy = 15	
		
		' the fft needs to be smoothed out, so we create an array of floats
		' for that purpose:
		fftSmoothed = Float Ptr(MemAlloc(8192 * 4))
		
		bandsToGet = 128
	End Method
	
	Method update()
'DebugStop
		ofBackground(80,80,20)

		' (1) we increase px and py by adding vx and vy
		px :+ vx
		py :+ vy
		
		' (2) check for collision, and trigger sounds:
		' horizontal collisions:
		If px < 0 Then
			px = 0
			vx :* -1
			dog.play()
		Else If px > ofGetWidth() Then
			px = ofGetWidth()
			vx :* -1
			ow.play()
		End If
		' vertical collisions:
		If py < 0 Then
			py = 0
			vy :* -1
			rooster.play()
		Else If py > ofGetHeight() Then
			py = ofGetHeight()
			vy :* -1
			beat.play()
		End If
		' (3) slow down velocity:
		vx 	:* 0.996
		vy 	:* 0.996
	
		' (4) we use velocity for volume of the samples:
		Local vel:Float = Sqr(vx * vx + vy * vy)
		ow.setVolume(Min(vel/5.0, 1))
		beat.setVolume(Min(vel/5.0, 1))
		dog.setVolume(Min(vel/5.0, 1))
		rooster.setVolume(Min(vel/5.0, 1))
	
		' (5) grab the fft, and put in into a "smoothed" array,
		'		by taking maximums, as peaks and then smoothing downward
		Local val:Float Ptr = ofSoundGetSpectrum(bandsToGet)		' request 128 values for fft
		
		For Local i:Int = 0 Until bandsToGet
			
			' let the smoothed calue sink to zero:
			fftSmoothed[i] :* 0.96
			
			' take the max, either the smoothed or the incoming:
			If fftSmoothed[i] < val[i] Then
				fftSmoothed[i] = val[i]
			End If
			
		Next

	
		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		ofEnableAlphaBlending()
			ofSetColor(255, 255, 255, 100)
			ofRect(100, ofGetHeight() - 300 , 640, 200)
		ofDisableAlphaBlending()
		
		' draw the fft resutls:
		ofSetColor(255,255,255,255)
		
		Local width:Float = 640.0 / bandsToGet
		For Local i:Int = 0 Until bandsToGet
			' (we use negative height here, because we want to flip them
			' because the top corner is 0,0)
			ofRect(100 + i * width, ofGetHeight() - 100, width, -(fftSmoothed[i] * 200))
		Next
		
		' finally draw the playing circle:
	
		ofEnableAlphaBlending()
			ofSetColor(255, 255, 255, 20)
			ofCircle(px, py, 50)
		ofDisableAlphaBlending()
		
		ofSetColorHex($ffffff)
		ofCircle(px, py, 8)
	End Method
	
End Type

