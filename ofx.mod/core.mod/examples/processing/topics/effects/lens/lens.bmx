SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d


Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 640, 360, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field lensD:Int = 256  ' Lens diameter
	Field lensArray:Int[] = New Int[lensD * lensD]  ' Height and width of lens

	Field lensEffect:ofImage
	Field lensImage:ofImage
	Field lensImage2:ofImage

	Field xx:Int = 0
	Field yy:Int = 0 
	Field dx:Int = 1
	Field dy:Int = 1

	Method setup()
		' Load background image
		lensEffect = New ofImage
		lensEffect.LoadImage("data/red_smoke.jpg")
		lensEffect.resize(640, 360)
		
		' Create buffered image for image to warp
		lensImage = New ofImage
		lensImage.allocate(lensD, lensD, OF_IMAGE_COLOR_ALPHA)

		lensImage2 = New ofImage
		lensImage2.allocate(lensD, lensD, OF_IMAGE_COLOR_ALPHA)

		' Lens algorithm (transformation array)
		Local magFactor:Int = 40  ' Magnification factor
		Local m:Int, a:Int, b:Int
		
		Local r:Int = lensD / 2
		Local s:Float = Sqr(r*r - magFactor*magFactor)
		
		For Local y:Int = -r Until r
			For Local x:Int = -r Until r
				If x*x + y*y >= s*s Then
					a = x;
					b = y;
				Else
					Local z:Float = Sqr(r*r - x*x - y*y)
					a = x * magFactor / z + 0.5
					b = y * magFactor / z + 0.5
				End If
				lensArray[(y + r)*lensD + (x + r)] = (b + r) * lensD + (a + r)
			Next
		Next
		
	End Method
	
	Method update()
		' Bounce lens around the screen
		If (xx + dx + lensD > lensEffect.getWidth()) Or (xx + dx < 0) Then
			dx = -dx
		End If
		
		If (yy + dy + lensD > lensEffect.getHeight()) Or (yy + dy < 0) Then
			dy = -dy
		End If
		
		xx :+ dx
		yy :+ dy

		If KeyHit(key_escape) Then
			End
		End If
	End Method

	Method draw()

		' save the background of lensHeight*lensWidth pixels rectangle at the coordinates 
		' where the lens effect will be applied.
		' copy() requires both source and image to be 32-bit
		lensImage2.copy(lensEffect, xx, yy, lensD, lensD, 0, 0, lensD, lensD)
		
		' For each pixel in the destination rectangle, apply the color
		' from the appropriate pixel in the saved background. The lensArray
		' array tells the offset into the saved background.
		Local pixels:Int Ptr = Int Ptr(lensImage.getPixels())
		Local image2Pixels:Int Ptr = Int Ptr(lensImage2.getPixels())
		For Local i:Int = 0 Until lensD * lensD
			pixels[i] = image2Pixels[lensArray[i]] 
		Next
		lensImage.update()
		
		' Restore the original picture
		lensEffect.draw(0, 0)
		
		' Overlay the lens square
		lensImage.draw(xx, yy, lensD, lensD)
	End Method

End Type

