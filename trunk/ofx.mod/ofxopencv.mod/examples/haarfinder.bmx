SuperStrict

Framework ofx.ofxopencv 
Import ofx.ofxglmax2d
Import brl.glmax2d

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 1024, 768, OF_WINDOW)

ofRunApp(New TTestApp)

Type TTestApp Extends ofBaseApp

	Field vidGrabber:ofVideoGrabber

	Field colorImg:ofxCvColorImage
	Field grayImage:ofxCvGrayscaleImage

	Field finder:ofxCvHaarFinder
	
	Field learnBackground:Int
	Field threshold:Int
	

	Method setup()
		vidGrabber = New ofVideoGrabber
		vidGrabber.setVerbose(True)
		vidGrabber.initGrabber(640, 480)
		
		colorImg = New ofxCvColorImage
		colorImg.allocate(640, 480)
		
		grayImage = New ofxCvGrayscaleImage
		grayImage.allocate(640, 480)
		
		finder = New ofxCvHaarFinder
		finder.setup("data/haarcascade_frontalface_default.xml")
		
	End Method

	Method update()

		vidGrabber.grabFrame()
		
		If vidGrabber.isFrameNew() Then
	
			colorImg.setFromPixels(vidGrabber.getPixels(), 640, 480)
		
			grayImage.copy(colorImg)
			
			finder.findHaarObjects(grayImage)
			
		End If


		If KeyHit(key_escape) Then
			End
		End If
	End Method

	Method draw()
		' draw the incoming, the grayscale, the bg And the thresholded difference
		ofSetColorHex($ffffff)
		colorImg.draw(20,20)

		For Local blob:ofxCvBlob = EachIn finder
			blob.draw(20, 20)
		Next
		
	End Method
	
	
End Type


