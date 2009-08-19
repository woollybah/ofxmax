SuperStrict

Import "common.bmx"

Type ofColor

	Field colorPtr:Byte Ptr
	
	
	Function RGBtoHSB:Float[](r:Int, g:Int, b:Int, hsbvals:Float[] = Null)
		Local hue:Float, saturation:Float, brightness:Float
	
		If Not hsbvals Then
			hsbvals = New Float[3]
		End If
		
		Local cmax:Int
		If r > g Then
			cmax = r
		Else
			cmax = g
		End If
		
		If b > cmax Then
			cmax = b
		End If
		
		Local cmin:Int
		If r < g Then
			cmin = r
		Else
			cmin = g
		End If
		
		If b < cmin Then
			cmin = b
		End If
		
		brightness = cmax / 255.0
		If cmax <> 0 Then
			saturation = (cmax - cmin) / Float(cmax)
		Else
			saturation = 0
		End If
		
		If saturation = 0 Then
			hue = 0
		Else
			Local redc:Float = (cmax - r) / Float(cmax - cmin)
			Local greenc:Float = (cmax - g) / Float(cmax - cmin)
			Local bluec:Float = (cmax - b) / Float(cmax - cmin)
			
			If r = cmax Then
				hue = bluec - greenc
			Else If g = cmax Then
				hue = 2.0 + redc - bluec
			Else
				hue = 4.0 + greenc - redc
				End If
				
			hue :/ 6.0
				
			If hue < 0 Then
				hue :+ 1.0
			End If
		End If
			
		hsbvals[0] = hue
		hsbvals[1] = saturation
		hsbvals[2] = brightness

		Return hsbvals
	End Function

	Function HSBtoRGB:Int(hue:Float, saturation:Float, brightness:Float)
		Local r:Int = 0, g:Int = 0, b:Int = 0
		If saturation = 0 Then
			b = (brightness * 255.0 + 0.5)
			g = b
			r = g
		Else
			Local h:Float = (hue - Floor(hue)) * 6.0
			Local f:Float = h - Floor(h)
			Local p:Float = brightness * (1.0 - saturation)
			Local q:Float = brightness * (1.0 - saturation * f)
			Local t:Float = brightness * (1.0 - (saturation * (1.0 - f)))
			Select Int(h)
				Case 0
					r = (brightness * 255.0 + 0.5)
					g = (t * 255.0 + 0.5)
					b = (p * 255.0 + 0.5)
				Case 1
					r = (q * 255.0 + 0.5)
					g = (brightness * 255.0 + 0.5)
					b = (p * 255.0 + 0.5)
				Case 2
					r = (p * 255.0 + 0.5)
					g = (brightness * 255.0 + 0.5)
					b = (t * 255.0 + 0.5)
				Case 3
					r = (p * 255.0 + 0.5)
					g = (q * 255.0 + 0.5)
					b = (brightness * 255.0 + 0.5)
				Case 4
					r = (t * 255.0 + 0.5)
					g = (p * 255.0 + 0.5)
					b = (brightness * 255.0 + 0.5)
				Case 5
					r = (brightness * 255.0 + 0.5)
					g = (p * 255.0 + 0.5)
					b = (q * 255.0 + 0.5)
			End Select
		End If
		Return $ff000000 | (r Shl 16) | (g Shl 8) | (b Shl 0)
	End Function	
End Type

Global _cacheHsbKey:Int
Global _cacheHsbValue:Float[3]

Rem
bbdoc: 
End Rem
Function ofHue:Float(value:Int)
	If value <> _cacheHsbKey Then
		ofColor.RGBtoHSB((value Shr 16) & $ff, (value Shr 8) & $ff, value & $ff, _cacheHsbValue)
		_cacheHsbKey = value
	End If
    
    Return _cacheHsbValue[0] * 255
End Function

Function ofSaturation:Float(value:Int)
	If value <> _cacheHsbKey Then
		ofColor.RGBtoHSB((value Shr 16) & $ff, (value Shr 8) & $ff, value & $ff, _cacheHsbValue)
		_cacheHsbKey = value
	End If
	Return _cacheHsbValue[1] * 255
End Function
	
Function ofBrightness:Float(value:Int)
	If value <> _cacheHsbKey Then
		ofColor.RGBtoHSB((value Shr 16) & $ff, (value Shr 8) & $ff, value & $ff, _cacheHsbValue)
		_cacheHsbKey = value
	End If
	Return _cacheHsbValue[2] * 255
End Function
		

Rem
bbdoc: 
End Rem
Function ofGetElapsedTimeMillis:Int()
	Return bmx_ofx_ofGetElapsedTimeMillis()
End Function

Rem
bbdoc: 
End Rem
Function ofGetElapsedTimef:Float()
	Return bmx_ofx_ofGetElapsedTimef()
End Function

Rem
bbdoc: 
End Rem
Function ofResetElapsedTimeCounter()
	bmx_ofx_ofResetElapsedTimeCounter()
End Function
