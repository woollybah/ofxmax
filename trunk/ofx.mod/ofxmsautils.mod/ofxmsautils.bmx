SuperStrict


Module ofx.ofxMSAUtils

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."

ModuleInfo "CC_OPTS: -fexceptions"


Import "common.bmx"


Type msaColor Extends ofColor

	Method New()
		colorPtr = bmx_ofx_msacolor_new()
	End Method
	
	Method Delete()
		If colorPtr Then
			bmx_ofx_msacolor_free(colorPtr)
			colorPtr = Null
		End If
	End Method
	
	Method setHSV(f:Float, s:Float, v:Float, a:Float = 1)
		bmx_ofx_msacolor_sethsv(colorPtr, f, s, v, a)
	End Method
	
	Method r:Float()
		Return bmx_ofx_msacolor_r(colorPtr)
	End Method

	Method g:Float()
		Return bmx_ofx_msacolor_g(colorPtr)
	End Method

	Method b:Float()
		Return bmx_ofx_msacolor_b(colorPtr)
	End Method

	Method a:Float()
		Return bmx_ofx_msacolor_a(colorPtr)
	End Method

End Type

