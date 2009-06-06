SuperStrict

Framework ofx.ofxFiducialFinder 
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
	
	Field finder:ofxFiducialTracker
	
	Field learnBackground:Int
	Field threshold:Int
	Field backgroundSubOn:Int
	
	Field mX:Int
	Field mY:Int

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
		
		finder = New ofxFiducialTracker
		
		threshold = 80
		learnBackground = True
		backgroundSubOn = False
		
	End Method

	Method update()

		ofBackground(100,100,100)
		vidGrabber.grabFrame()
		
		If vidGrabber.isFrameNew() Then
	
			colorImg.setFromPixels(vidGrabber.getPixels(), 320,240)
		
			grayImage.copy(colorImg)
			If learnBackground = True Then
				grayBg.copy(grayImage) ' copies the pixels from grayImage into grayBg
				learnBackground = False
				backgroundSubOn = True
			End If
			
			' take the abs value of the difference between background and incoming and then threshold:
			If backgroundSubOn Then
				grayDiff.absDiff(grayBg, grayImage)
			Else
				grayDiff.copy(grayImage)
			End If
			
			grayDiff.threshold(threshold)
			finder.findFiducials(grayDiff)
			
		End If


		If KeyHit(key_escape) Then
			End
		End If
		
		mX = MouseX()
		mY = MouseY()
	End Method

	Method draw()
		ofSetColorHex($ffffff)

		' draw the incoming, the grayscale, the bg And the thresholded difference
		colorImg.draw(20,20)
		grayImage.draw(360,20)
		grayBg.draw(20,280)
		grayDiff.draw(360,280)
		
		For Local fiducial:ofxFiducial = EachIn finder.getFiducials()
			fiducial.draw(20, 20)
			fiducial.drawCorners(20, 20) ' draw corners
			
			ofSetColor(0,0,255) ' set color To blue
			
			' if mouse (- 20 to compensate for drawing at 20) is inside fiducial then fill
			if fiducial.isPointInside(mX - 20, mY - 20) then
				ofFill()
			Else
				ofNoFill() ' else dont
			End If
			ofCircle(mX, mY, 10) 'draw mouse position
			ofSetColor(255,255,255) 'reset color to white

		Next
		
	End Method
	
	
End Type


