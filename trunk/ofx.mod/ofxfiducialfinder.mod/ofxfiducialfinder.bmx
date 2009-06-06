SuperStrict

Rem
bbdoc: 
End Rem
Module ofx.ofxFiducialFinder

ModuleInfo "CC_OPTS: -fexceptions"

Import "common.bmx"

Rem
bbdoc: 
End Rem
Type ofxFiducialFinder

	Field finderPtr:Byte Ptr
	
	Field iter:ofxFiducialIterator
	
	Method New()
		finderPtr = bmx_ofx_ofxfiducialfinder_new()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method findFiducials(inp:ofxCvGrayscaleImage)
		bmx_ofx_ofxfiducialfinder_findfiducials(finderPtr, inp.cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method initTree(filename:String)
		bmx_ofx_ofxfiducialfinder_inittree(finderPtr, filename)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method initDefaultTree()
		bmx_ofx_ofxfiducialfinder_initdefaulttree(finderPtr)
	End Method
	
	Method Free()
		If finderPtr Then
			bmx_ofx_ofxfiducialfinder_free(finderPtr)
			finderPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

	Rem
	bbdoc: 
	End Rem
	Method getFiducials:ofxFiducialEnum()
		Local this:ofxFiducialFinderEnum = New ofxFiducialFinderEnum
		this.finderPtr = finderPtr
		Return this
	End Method

End Type

Rem
bbdoc: 
End Rem
Type ofxFiducialTracker

	Field finderPtr:Byte Ptr
	
	Method New()
		finderPtr = bmx_ofx_ofxfiducialtracker_new()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method findFiducials(inp:ofxCvGrayscaleImage)
		bmx_ofx_ofxfiducialtracker_findfiducials(finderPtr, inp.cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method initTree(filename:String)
		bmx_ofx_ofxfiducialtracker_inittree(finderPtr, filename)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method initDefaultTree()
		bmx_ofx_ofxfiducialtracker_initdefaulttree(finderPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method Free()
		If finderPtr Then
			bmx_ofx_ofxfiducialtracker_free(finderPtr)
			finderPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

	Rem
	bbdoc: 
	End Rem
	Method getFiducials:ofxFiducialEnum()
		Local this:ofxFiducialTrackerEnum = New ofxFiducialTrackerEnum
		this.finderPtr = finderPtr
		Return this
	End Method

End Type

Type ofxFiducialEnum

	Field finderPtr:Byte Ptr
	Field iter:ofxFiducialIterator
	
	Method ObjectEnumerator:ofxFiducialIterator() Abstract
	
End Type

Type ofxFiducialTrackerEnum Extends ofxFiducialEnum

	Method ObjectEnumerator:ofxFiducialIterator()
		If iter Then
			iter.Free()
		End If
		iter = ofxFiducialIterator._create(bmx_ofx_ofxfiducialtracker_getfiducials(finderPtr))
		Return iter
	End Method

End Type

Type ofxFiducialFinderEnum Extends ofxFiducialEnum

	Method ObjectEnumerator:ofxFiducialIterator()
		If iter Then
			iter.Free()
		End If
		iter = ofxFiducialIterator._create(bmx_ofx_ofxfiducialfinder_getfiducials(finderPtr))
		Return iter
	End Method

End Type


Rem
bbdoc: 
End Rem
Type ofxFiducialIterator

	Field iterPtr:Byte Ptr

	Function _create:ofxFiducialIterator(iterPtr:Byte Ptr)
		If iterPtr Then
			Local this:ofxFiducialIterator = New ofxFiducialIterator
			this.iterPtr = iterPtr
			Return this
		End If
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method size:Int()
		Return bmx_ofx_ofxfiducialiterator_size(iterPtr)
	End Method
	
	Method HasNext:Int()
		Return bmx_ofx_ofxfiducialiterator_hasnext(iterPtr)
	End Method

	Method NextObject:Object()
		Return ofxFiducial._create(bmx_ofx_ofxfiducialiterator_next(iterPtr))
	End Method

	Method Free()
		If iterPtr Then
			bmx_ofx_ofxfiducialiterator_free(iterPtr)
			iterPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method
	
End Type


Rem
bbdoc: 
End Rem
Type ofxFiducial

	Field fiducialPtr:Byte Ptr

	Function _create:ofxFiducial(fiducialPtr:Byte Ptr)
		If fiducialPtr Then
			Local this:ofxFiducial = New ofxFiducial
			this.fiducialPtr = fiducialPtr
			Return this
		End If
	End Function

	Rem
	bbdoc: 
	End Rem
	Method getId:Int()
		Return bmx_ofx_ofxfiducial_getid(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getMSpeed:Float()
		Return bmx_ofx_ofxfiducial_getmspeed(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getMAccel:Float()
		Return bmx_ofx_ofxfiducial_getmaccel(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getMSpeedX:Float()
		Return bmx_ofx_ofxfiducial_getmspeedx(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getMSpeedY:Float()
		Return bmx_ofx_ofxfiducial_getmspeedy(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getX:Float()
		Return bmx_ofx_ofxfiducial_getx(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getY:Float()
		Return bmx_ofx_ofxfiducial_gety(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getAngle:Float()
		Return bmx_ofx_ofxfiducial_getangle(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getRSpeed:Float()
		Return bmx_ofx_ofxfiducial_getrspeed(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getRAccel:Float()
		Return bmx_ofx_ofxfiducial_getraccel(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getRootSize:Float()
		Return bmx_ofx_ofxfiducial_getrootsize(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getCornerUpdateStatus:Int()
		Return bmx_ofx_ofxfiducial_getcornerupdatestatus(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setUpdateCorners(_update:Int)
		bmx_ofx_ofxfiducial_setupdatecorners(fiducialPtr, _update)
	End Method
	

	Rem
	bbdoc: 
	End Rem
	Method update(x:Float, y:Float, angle:Float, root:Float, leaf:Float)
		bmx_ofx_ofxfiducial_update(fiducialPtr, x, y, angle, root, leaf)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method isAlive:Int()
		Return bmx_ofx_ofxfiducial_isalive(fiducialPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method computeCorners()
		bmx_ofx_ofxfiducial_computecorners(fiducialPtr)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method isPointInside:Int(x:Float, y:Float)
		Return bmx_ofx_ofxfiducial_ispointinside(fiducialPtr, x, y)
	End Method
	
	Method isFidCollided(fid:ofxFiducial)
	' TODO
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getDistance:Float(x:Float, y:Float)
		Return bmx_ofx_ofxfiducial_getdistance(fiducialPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method draw(x:Float, y:Float)
		bmx_ofx_ofxfiducial_draw(fiducialPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method drawCorners(x:Float, y:Float)
		bmx_ofx_ofxfiducial_drawcorners(fiducialPtr, x, y)
	End Method

End Type

