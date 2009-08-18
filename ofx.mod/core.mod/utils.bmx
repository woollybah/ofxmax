SuperStrict

Import "common.bmx"


Type ofColor

	Field colorPtr:Byte Ptr
	
End Type

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
