SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d


Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 512, 512, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field nPoints:Int = 4096 ' points to draw 
	Field complexity:Float = 8 ' wind complexity 
	Field maxMass:Float = .8 ' max pollen mass 
	Field timeSpeed:Float = .02 ' wind variation speed 
	Field phase:Float = TWO_PI ' separate u-noise from v-noise 
	 
	Field windSpeed:Float = 40 ' wind vector magnitude for debug 
	Const stepSize:Int = 10 ' spatial sampling rate for debug 
	 
	Field pollenMass:Float[]
	Field points:Float[][]
	
	Field debugMode:Int = True
	
	Field width:Int = ofGetWidth()
	Field height:Int = ofGetHeight()
	
	Method setup()
		points = points[..nPoints]
		pollenMass = New Float[nPoints] 
						
		For Local i:Int = 0 Until nPoints
			points[i] = [Float(Rnd(0, ofGetWidth())), Float(Rnd(0, ofGetHeight()))]
			pollenMass[i] = Rand(0, maxMass)
		Next
		
		ofNoiseDetail(14) 
		ofBackground(255, 255, 255) 
	End Method

	Method update()
		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		Local t:Float = ofGetFrameNum() * ofGetFrameRate() 

		If debugMode Then
			'background(255)
			ofSetColor(0, 0, 0)
			'stroke(0) 
			Local s:Float = windSpeed 
			For Local i:Int = 0 Until width Step stepSize 
				For Local j:Int = 0 Until height Step stepSize
					Local normx:Float = ofMap(i, 0, width, 0, 1) 
					Local normy:Float = ofMap(j, 0, height, 0, 1) 
					Local u:Float = ofNoise(t + phase, normx * complexity + phase, normy * complexity + phase) 
					Local v:Float = ofNoise(t - phase, normx * complexity - phase, normy * complexity + phase) 
					ofPushMatrix() 
					ofTranslate(i, j) 
					ofLine(0, 0, ofLerp(-windSpeed, windSpeed, u), ofLerp(-windSpeed, windSpeed, v)) 
					ofPopMatrix() 
				Next
			Next
			ofSetColor(255, 0, 0) 
		Else
			'stroke(0, 10) 
			ofSetColor(0, 10, 0)
		End If 
		 
		For Local i:Int = 0 Until nPoints
			Local x:Float = points[i][0] 
			Local y:Float = points[i][1] 
			 
			Local normx:Float = ofNormalize(x, 0, width) 
			Local normy:Float = ofNormalize(y, 0, height) 
			Local u:Float = ofNoise(t + phase, normx * complexity + phase, normy * complexity + phase) 
			Local v:Float = ofNoise(t - phase, normx * complexity - phase, normy * complexity + phase) 
			Local speed:Float = (1 + ofNoise(t, u, v)) / pollenMass[i] 
			x :+ ofLerp(-speed, speed, u) 
			y :+ ofLerp(-speed, speed, v) 
			 
			If x < 0 Or x > width Or y < 0 Or y > height Then
				x = Rnd(0, width) 
				y = Rnd(0, height) 
			End If
			 
			If debugMode Then
			'	ofNoFill()
		'		ofEllipse(x, y, 10, 10)
			Else
				Plot(x, y)
			End If
			 
			points[i][0] = x 
			points[i][1] = y 
		Next
	End Method
	
End Type

