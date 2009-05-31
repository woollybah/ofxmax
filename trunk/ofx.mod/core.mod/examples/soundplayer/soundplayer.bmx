SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 1024, 768, OF_WINDOW)'OF_FULLSCREEN)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field beats:ofSoundPlayer
	Field synth:ofSoundPlayer
	Field vocals:ofSoundPlayer
	
	Field font:ofTrueTypeFont
	Field synthPosition:Float

		
	Method setup()
		synth = New ofSoundPlayer
		beats = New ofSoundPlayer
		vocals = New ofSoundPlayer

		synth.LoadSound("data/sounds/synth.wav")
		beats.LoadSound("data/sounds/1085.mp3")
		vocals.LoadSound("data/sounds/Violet.mp3")

		synth.setVolume(0.75)
		beats.setVolume(0.75)
		vocals.setVolume(0.5)
		
		font = New ofTrueTypeFont
		font.loadFont("data/Sudbury_Basin_3D.ttf", 32)
		
		beats.setMultiPlay(False)
		vocals.setMultiPlay(True)
	End Method
	
	Method update()
		ofBackground(255,255,255)


		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
	
		Local tempStr:String

		' draw the background colors:
		local widthDiv:float = ofGetWidth() / 3.0
		ofSetColorHex($eeeeee)
		ofRect(0, 0, widthDiv, ofGetHeight()) 
		ofSetColorHex($ffffff)
		ofRect(widthDiv, 0, widthDiv, ofGetHeight()) 
		ofSetColorHex($dddddd)
		ofRect(widthDiv*2, 0, widthDiv, ofGetHeight()) 
		
		
		'---------------------------------- synth:
		if synth.getIsPlaying() then
			ofSetColorHex($FF0000)
		Else
			ofSetColorHex($000000)
		End If
		font.drawString("synth !!", 50,50)
		
		ofSetColorHex($000000)
		tempStr = "click to play~npct done: " + synth.getPosition() + "~nspeed: " + synth.getSpeed() + ..
			"~npan: " + synth.getPan()
		ofDrawBitmapString(tempStr, 50, ofGetHeight()-50)
		
		'---------------------------------- beats:
		if beats.getIsPlaying() then
			ofSetColorHex($FF0000)
		Else
			ofSetColorHex($000000)
		End If
		font.drawString("beats !!", widthDiv+50,50)
		
		ofSetColorHex($000000)
		tempStr = "click and drag~npct done: " + beats.getPosition() + "~nspeed: " + beats.getSpeed()
		ofDrawBitmapString(tempStr, widthDiv+50, ofGetHeight()-50)
		
		'---------------------------------- vocals:
		if vocals.getIsPlaying() then
			ofSetColorHex($FF0000)
		Else
			ofSetColorHex($000000)
		End If
		font.drawString("vocals !!", widthDiv*2+50,50)
		
		ofSetColorHex($000000)
		tempStr = "click to play (multiplay)~npct done: " + vocals.getPosition() + "~nspeed: " + vocals.getSpeed()
		ofDrawBitmapString(tempStr, widthDiv*2+50,ofGetHeight()-50)


	End Method

End Type


