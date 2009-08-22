SuperStrict

Import "common.bmx"

Rem
bbdoc: 
End Rem
Function ofNormalize:Float(value:Float, _min:Float, _max:Float)
	Return bmx_of_ofNormalize(value, _min, _max)
End Function

Rem
bbdoc: 
End Rem
Function ofMap:Float(value:Float, inputMin:Float, inputMax:Float, outputMin:Float, outputMax:Float)
	Return bmx_of_ofMap(value, inputMin, inputMax, outputMin, outputMax)
End Function

Rem
bbdoc: 
End Rem
Function ofClamp:Float(value:Float, _min:Float, _max:Float)
	Return bmx_of_ofClamp(value, _min, _max)
End Function

Rem
bbdoc: 
End Rem
Function ofLerp:Float(start:Float, stop:Float, amt:Float)
	Return bmx_of_ofLerp(start, stop, amt)
End Function

Rem
bbdoc: 
End Rem
Function ofDist:Float(x1:Float, y1:Float, x2:Float, y2:Float)
	Return bmx_of_ofDist(x1, y1, x2, y2)
End Function

Rem
bbdoc: 
End Rem
Function ofDistSquared:Float(x1:Float, y1:Float, x2:Float, y2:Float)
	Return bmx_of_ofDistSquared(x1, y1, x2, y2)
End Function

Rem
bbdoc: 
End Rem
Function ofSign:Int(n:Float)
	Return bmx_of_ofSign(n)
End Function

Rem
bbdoc: 
End Rem
Function ofInRange:Int(t:Float, _min:Float, _max:Float)
	Return bmx_of_ofInRange(t, _min, _max)
End Function

Rem
bbdoc: 
End Rem
Function ofRadToDeg:Float(radians:Float)
	Return bmx_of_ofRadToDeg(radians)
End Function

Rem
bbdoc: 
End Rem
Function ofDegToRad:Float(degrees:Float)
	Return bmx_of_ofDegToRad(degrees)
End Function

Rem
bbdoc: 
End Rem
Function ofRandomWidth:Float()
	Return bmx_of_ofRandomWidth()
End Function

Rem
bbdoc: 
End Rem
Function ofRandomHeight:Float()
	Return bmx_of_ofRandomHeight()
End Function


