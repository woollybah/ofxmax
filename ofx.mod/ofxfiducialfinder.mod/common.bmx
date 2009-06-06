SuperStrict

Import "source.bmx"


Extern

	Function bmx_ofx_ofxfiducialfinder_new:Byte Ptr()
	Function bmx_ofx_ofxfiducialfinder_findfiducials(handle:Byte Ptr, inp:Byte Ptr)
	Function bmx_ofx_ofxfiducialfinder_inittree(handle:Byte Ptr, filename:String)
	Function bmx_ofx_ofxfiducialfinder_initdefaulttree(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialfinder_free(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialfinder_getfiducials:Byte Ptr(handle:Byte Ptr)

	Function bmx_ofx_ofxfiducialiterator_size:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialiterator_hasnext:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialiterator_next:Byte Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialiterator_free(handle:Byte Ptr)

	Function bmx_ofx_ofxfiducialtracker_new:Byte Ptr()
	Function bmx_ofx_ofxfiducialtracker_findfiducials(handle:Byte Ptr, inp:Byte Ptr)
	Function bmx_ofx_ofxfiducialtracker_inittree(handle:Byte Ptr, filename:String)
	Function bmx_ofx_ofxfiducialtracker_initdefaulttree(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialtracker_free(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducialtracker_getfiducials:Byte Ptr(handle:Byte Ptr)

	Function bmx_ofx_ofxfiducial_draw(handle:Byte Ptr, x:Float, y:Float)
	Function bmx_ofx_ofxfiducial_drawcorners(handle:Byte Ptr, x:Float, y:Float)
	Function bmx_ofx_ofxfiducial_isalive:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_ispointinside:Int(handle:Byte Ptr, x:Float, y:Float)
	Function bmx_ofx_ofxfiducial_getid:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getmspeed:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getmaccel:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getmspeedx:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getmspeedy:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getx:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_gety:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getangle:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getrspeed:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getraccel:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getrootsize:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getcornerupdatestatus:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_setupdatecorners(handle:Byte Ptr, _update:Int)
	Function bmx_ofx_ofxfiducial_update(handle:Byte Ptr, x:Float, y:Float, angle:Float, root:Float, leaf:Float)

	Function bmx_ofx_ofxfiducial_computecorners(handle:Byte Ptr)
	Function bmx_ofx_ofxfiducial_getdistance:Float(handle:Byte Ptr, x:Float, y:Float)


End Extern



