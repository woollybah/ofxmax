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
	Field grayBg:ofxCvGrayscaleImage
	Field grayDiff:ofxCvGrayscaleImage
	
	Field contourFinder:ofxCvContourFinder
	
	Field learnBackground:Int
	Field threshold:Int
	

	Method setup()
		vidGrabber = New ofVideoGrabber
		vidGrabber.setVerbose(True)
		vidGrabber.initGrabber(320,240)
		
		colorImg = New ofxCvColorImage
		colorImg.allocate(320,240)
		
		grayImage = New ofxCvGrayscaleImage
		grayImage.allocate(320,240)
		
		grayBg = New ofxCvGrayscaleImage
		grayBg.allocate(320,240)
		
		grayDiff = New ofxCvGrayscaleImage
		grayDiff.allocate(320,240)
		
		contourFinder = New ofxCvContourFinder
		
		learnBackground = True
		threshold = 80
	End Method

	Method update()

		Local newFrame:Int = False

		vidGrabber.grabFrame()
		newFrame = vidGrabber.isFrameNew()
		
		If newFrame Then
	
			colorImg.setFromPixels(vidGrabber.getPixels(), 320,240)
		
			grayImage.copy(colorImg)
			If learnBackground = True Then
				grayBg.copy(grayImage) ' copies the pixels from grayImage into grayBg
				learnBackground = False
			End If
			
			' take the abs value of the difference between background and incoming and then threshold:
			grayDiff.absDiff(grayBg, grayImage)
			grayDiff.threshold(threshold)
			
			' find contours which are between the size of 20 pixels and 1/3 the w*h pixels.
			' also, find holes is set to true so we will get interior contours as well....
			contourFinder.findContours(grayDiff, 20, (340*240)/3, 10, True)	' find holes
		End If


		If KeyHit(key_escape) Then
			End
		End If
	End Method

	Method draw()
		' draw the incoming, the grayscale, the bg And the thresholded difference
		'ofSetColor(0xffffff)
		colorImg.draw(20,20)
		grayImage.draw(360,20)
		grayBg.draw(20,280)
		grayDiff.draw(360,280)
		
		SetColor $33, $33, $33
		DrawRect 360,540,320,240
		
		' we could draw the whole contour finder
		contourFinder.draw(360,540)
		
		SetColor 255, 255, 255
		DrawText "Hello", 10, 10
	End Method
	
	
End Type

