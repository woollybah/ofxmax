SuperStrict

Import "source.bmx"


Extern

	Function bmx_ofx_msacolor_new:Byte Ptr()
	Function bmx_ofx_msacolor_free(handle:Byte Ptr)
	Function bmx_ofx_msacolor_sethsv(handle:Byte Ptr, f:Float, s:Float, v:Float, a:Float)
	Function bmx_ofx_msacolor_r:Float(handle:Byte Ptr)
	Function bmx_ofx_msacolor_g:Float(handle:Byte Ptr)
	Function bmx_ofx_msacolor_b:Float(handle:Byte Ptr)
	Function bmx_ofx_msacolor_a:Float(handle:Byte Ptr)


End Extern



