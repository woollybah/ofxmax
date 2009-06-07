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
	Field oldDiff:ofxCvGrayscaleImage
	
	Field flow:ofxCvOpticalFlowLK
	
	Field learnBackground:Int
	Field threshold:Int
	Field hasOldDiff:Int

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
		
		'grayDiff = New ofxCvGrayscaleImage
		'grayDiff.allocate(320,240)

		oldDiff = New ofxCvGrayscaleImage
		oldDiff.allocate(320,240)
		
		flow = New ofxCvOpticalFlowLK
		flow.allocate(320, 240)
		
		learnBackground = True
		threshold = 80
		
	End Method

	Method update()

		vidGrabber.grabFrame()
		
		If vidGrabber.isFrameNew() Then
	
			colorImg.setFromPixels(vidGrabber.getPixels(), 320,240)
		
			grayImage.copy(colorImg)
			If learnBackground = True Then
				grayBg.copy(grayImage) ' copies the pixels from grayImage into grayBg
				learnBackground = False
			End If
			
			'grayImage.blurGaussian(10)
			' take the abs value of the difference between background and incoming and then threshold:
			'grayDiff.absDiff(grayBg, grayImage)
			'grayDiff.threshold(threshold)
			
			If hasOldDiff Then
				flow.calculateFlow(oldDiff, grayImage)
			End If			
			
			hasOldDiff = True
			oldDiff.copy(grayImage)
			
		End If


		If KeyHit(key_escape) Then
			End
		End If
		If KeyHit(KEY_SPACE) Then
			learnBackground = True
		End If
	End Method

	Method draw()

		ofSetColorHex($ffffff)
		colorImg.draw(20,20)
		grayImage.draw(360,20)
		grayBg.draw(20,280)
		'grayDiff.draw(360,280)
		
		Local vx:Float, vy:Float
		
		For Local y:Int = 0 Until 240 Step 4
			For Local x:Int = 0 Until 320 Step 4
				flow.getVelocity(x, y, vx, vy)
				
				If vx Or vy Then
					DrawLine 20 + x, 20 + y, 20 + x + vx, 20 + y + vy
				End If
			Next
		Next
		
	End Method
	
	
End Type


