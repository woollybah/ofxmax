SuperStrict

Import BRL.Math
Import BaH.Random

Const PERLIN_YWRAPB:Int = 4
Const PERLIN_YWRAP:Int = 1 Shl PERLIN_YWRAPB
Const PERLIN_ZWRAPB:Int = 8
Const PERLIN_ZWRAP:Int = 1 Shl PERLIN_ZWRAPB
Const PERLIN_SIZE:Int = 4095

Global perlin_octaves:Int = 4
Global perlin_amp_falloff:Float = 0.5

Rem
bbdoc: 
End Rem
Function ofNoise:Float(x:Float, y:Float = 0, z:Float = 0)

	Global perlin:Float[]
	
	If Not perlin Then
		perlin = New Float[PERLIN_SIZE + 1]
		For Local i:Int = 0 Until PERLIN_SIZE + 1
			perlin[i] = RndFloat()
		Next
	End If
	
	If x < 0 Then
		x=-x
	End If
	If y < 0 Then
		y=-y
	End If
	If z < 0 Then
		z=-z
	End If
	
	Local xi:Int = x, yi:Int = y, zi:Int = z
	Local xf:Float = (x-xi)
	Local yf:Float = (y-yi)
	Local zf:Float = (z-zi)
	Local rxf:Float, ryf:Float
	
	Local r:Float=0
	Local ampl:Float=0.5
	
	Local n1:Float,n2:Float,n3:Float
	
	For Local i:Int = 0 Until perlin_octaves
		Local of:Int = xi + (yi Shl PERLIN_YWRAPB) + (zi Shl PERLIN_ZWRAPB)
		
		rxf = noise_fsc(xf)
		ryf = noise_fsc(yf)
		
		n1  = perlin[of Mod PERLIN_SIZE]
		n1 :+ rxf * (perlin[(of+1) Mod PERLIN_SIZE]-n1)
		n2  = perlin[(of+PERLIN_YWRAP) Mod PERLIN_SIZE]
		n2 :+ rxf * (perlin[(of+PERLIN_YWRAP+1) Mod PERLIN_SIZE]-n2)
		n1 :+ ryf * (n2-n1)
		
		of :+ PERLIN_ZWRAP
		n2  = perlin[of Mod PERLIN_SIZE]
		n2 :+ rxf * (perlin[(of+1) Mod PERLIN_SIZE]-n2)
		n3  = perlin[(of+PERLIN_YWRAP) Mod PERLIN_SIZE]
		n3 :+ rxf * (perlin[(of+PERLIN_YWRAP+1) Mod PERLIN_SIZE]-n3)
		n2 :+ ryf * (n3-n2)
		
		n1 :+ noise_fsc(zf) * (n2-n1)
		
		r :+ n1 * ampl
		ampl :* perlin_amp_falloff
		xi :Shl 1
		xf :* 2
		yi :Shl 1
		yf :* 2
		zi :Shl 1
		zf :* 2
		
		If xf >= 1.0 Then
			xi:+ 1
			xf:- 1
		End If
		If yf >= 1.0 Then
			yi:+ 1
			yf:- 1
		End If
		If zf >= 1.0 Then
			zi:+ 1
			zf:- 1
		End If
	Next
	Return r

End Function

Rem
bbdoc: 
End Rem
Function ofNoiseDetail(lod:Int, falloff:Float = 0)
	If lod > 0 Then
		perlin_octaves = lod
	End If
	
	If falloff > 0 Then
		perlin_amp_falloff = falloff
	End If
End Function

Const SINCOS_PRECISION:Float = 0.5
Const SINCOS_LENGTH:Int = 360 / SINCOS_PRECISION
Const SINCOS_PI:Int = SINCOS_LENGTH Shr 1

Function noise_fsc:Float(i:Float)
	Global cosTable:Float[]
	
	If Not cosTable Then
		cosTable = New Float[SINCOS_LENGTH]
		
		For Local i:Int = 0 Until SINCOS_LENGTH
			cosTable[i] = Cos(i * SINCOS_PRECISION)
		Next
	End If

    Return 0.5 * (1.0 - cosTable[(i * SINCOS_PI) Mod SINCOS_LENGTH])
End Function


