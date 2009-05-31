SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d

'
'DebugStop
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 800, 600, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field mx:Int
	Field my:Int

	Field camWidth:Int
	Field camHeight:Int
	
	Field vidGrabber:ofVideoGrabber
	Field videoTexture:ofTexture

	Method setup()
		camWidth 		= 320	' Try To grab at this size. 
		camHeight 		= 240
		
		vidGrabber = New ofVideoGrabber
		vidGrabber.setVerbose(True)
		vidGrabber.initGrabber(camWidth,camHeight)
		
		'videoInverted = New unsigned char[camWidth*camHeight*3]
		
		videoTexture = New ofTexture
		videoTexture.allocate(camWidth, camHeight, GL_RGB)
	End Method
		
	Method update()
		vidGrabber.grabFrame()
		
		mx = MouseX()
		my = MouseY()
		
		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		vidGrabber.draw(mx - 160, my - 120)
	End Method
	

	
End Type



