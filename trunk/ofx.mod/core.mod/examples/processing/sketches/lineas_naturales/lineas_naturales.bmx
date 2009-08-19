SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d
Import brl.random

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 1024, 768, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field gaboenritoque:ofImage

	Method setup()
	ofSetColor(255, 255, 255)
	
		gaboenritoque = New ofImage
		gaboenritoque.LoadImage("data/gaboenritoque.jpg")
		'size(gaboenritoque.width, gaboenritoque.height); //el tamaño del jpg 

		'noStroke();
		'colorMode(HSB, 350)
		'smooth() 
		'noLoop()
	End Method
	
	Method update()
		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
  Local ciador:Int = 3
Local pixels:Int Ptr = Int Ptr(gaboenritoque.getPixels())
  For Local y:Int = 0 Until gaboenritoque.getHeight() Step 3
    For Local x:Int = 0 Until gaboenritoque.getWidth() Step 3
      Local c:Int = pixels[x + y * gaboenritoque.getWidth()]
      tec(x, y, c, ciador)
    Next
Next
	End Method

	Method tec(x:Float, y:Float, c:Int, gabo:Int)
		Local puntos:Int = Rand(0, 1)
		For Local i:Int = 0 To puntos
			Local h:Float = ofHue(c) '+ Rnd(0, 10)
			Local s:Float = ofSaturation(c) '+ Rnd(0,55)
			Local b:Float = ofBrightness(c) '+ Rnd(0,55)
			ofPushMatrix()
				ofSetColorHex(c)'ofColor.HSBtoRGB(h, s, b))
				ofLine(x, y, x + Rand(0, 10), y + Rand(-5, 10))
				'ofstroke(h,s,b)
			ofPopMatrix()
		Next
	End Method

End Type

