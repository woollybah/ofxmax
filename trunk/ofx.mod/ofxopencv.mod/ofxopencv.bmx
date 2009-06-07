' Copyright (c) 2009 Bruce A Henderson
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'     * Redistributions of source code must retain the above copyright
'       notice, this list of conditions and the following disclaimer.
'     * Redistributions in binary form must reproduce the above copyright
'       notice, this list of conditions and the following disclaimer in the
'       documentation and/or other materials provided with the distribution.
'     * Neither the name of Bruce A Henderson nor the
'       names of its contributors may be used to endorse or promote products
'       derived from this software without specific prior written permission.
'
' THIS SOFTWARE IS PROVIDED BY Bruce A Henderson ``AS IS'' AND ANY
' EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL Bruce A Henderson BE LIABLE FOR ANY
' DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
' ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Rem
bbdoc: 
End Rem
Module ofx.ofxopencv

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."




ModuleInfo "CC_OPTS: -fexceptions"

?macos
ModuleInfo "LD_OPTS: -L%PWD%/ofxOpenCv/libs/opencv/lib/osx/"
?linux
ModuleInfo "LD_OPTS: -L%PWD%/ofxOpenCv/libs/opencv/lib/linux/"
?win32
ModuleInfo "LD_OPTS: -L%PWD%/ofxOpenCv/libs/opencv/lib/win32/"
?


Import "common.bmx"


Rem
bbdoc: 
End Rem
Type ofxCvImage

	Field cvImagePtr:Byte Ptr
	
	'Method New()
	'	cvImagePtr = bmx_ofx_ofxcvimage_new()
	'End Method
	
	Rem
	bbdoc: 
	End Rem
	Method allocate(w:Int, h:Int)
		bmx_ofx_ofxcvimage_allocate(cvImagePtr, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method clear()
		bmx_ofx_ofxcvimage_clear(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getWidth:Float()
		Return bmx_ofx_ofxcvimage_getwidth(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getHeight:Float()
		Return bmx_ofx_ofxcvimage_getheight(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setUseTexture(use:Int)
		bmx_ofx_ofxcvimage_setusetexture(cvImagePtr, use)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getPixels:Byte Ptr()
		Return bmx_ofx_ofxcvimage_getpixels(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method draw(x:Float, y:Float, w:Float = 0.0, h:Float = 0.0)
		bmx_ofx_ofxcvimage_draw(cvImagePtr, x, y, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPercent(xPct:Float, yPct:Float)
		bmx_ofx_ofxcvimage_setanchorpercent(cvImagePtr, xPct, yPct)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPoint(x:Int, y:Int)
		bmx_ofx_ofxcvimage_setanchorpoint(cvImagePtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method resetAnchor()
		bmx_ofx_ofxcvimage_resetanchor(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method erode()
		bmx_ofx_ofxcvimage_erode(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method dilate()
		bmx_ofx_ofxcvimage_dilate(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method blur(value:Int = 3)
		bmx_ofx_ofxcvimage_blur(cvImagePtr, value)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method blurGaussian(value:Int = 3)
		bmx_ofx_ofxcvimage_blurgaussian(cvImagePtr, value)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method invert()
		bmx_ofx_ofxcvimage_invert(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method contrastStretch()
		bmx_ofx_ofxcvimage_contrastStretch(cvImagePtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method convertToRange(_min:Float, _max:Float)
		bmx_ofx_ofxcvimage_convertToRange(cvImagePtr, _min, _max)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method resize(w:Int, h:Int)
		bmx_ofx_ofxcvimage_resize(cvImagePtr, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method scaleIntoMe(mom:ofxCvImage, interpolationMethod:Int = CV_INTER_NN)
		bmx_ofx_ofxcvimage_scaleintome(cvImagePtr, mom.cvImagePtr, interpolationMethod)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method mirror(flipVertically:Int, flipHorizontally:Int)
		bmx_ofx_ofxcvimage_mirror(cvImagePtr, flipVertically, flipHorizontally)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method translate(x:Float, y:Float)
		bmx_ofx_ofxcvimage_translate(cvImagePtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method rotate(angle:Float, centerX:Float, centerY:Float)
		bmx_ofx_ofxcvimage_rotate(cvImagePtr, angle, centerX, centerY)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method scale(scaleX:Float, scaleY:Float)
		bmx_ofx_ofxcvimage_scale(cvImagePtr, scaleX, scaleY)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method transform(angle:Float, centerX:Float, centerY:Float, scaleX:Float, scaleY:Float, moveX:Float, moveY:Float)
		bmx_ofx_ofxcvimage_transform(cvImagePtr, angle, centerX, centerY, scaleX, scaleY, moveX, moveY)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method undistort(radialDistX:Float, radialDistY:Float, tangentDistX:Float, tangentDistY:Float, focalX:Float, ..
			focalY:Float, centerX:Float, centerY:Float)
		bmx_ofx_ofxcvimage_undistort(cvImagePtr, radialDistX, radialDistY, tangentDistX, tangentDistY, focalX, ..
			focalY, centerX, centerY)
	End Method

	'Method warpPerspective( Const ofPoint& A, Const ofPoint& B,
    '                               Const ofPoint& C, Const ofPoint& D );
	'Method warpIntoMe(mom:ofxCvImage, ofPoint src[4], Const ofPoint dst[4] );

	
	Rem
	bbdoc: 
	End Rem
	Method countNonZeroInRegion:Int(x:Int, y:Int, w:Int, h:Int)
		Return bmx_ofx_ofxcvimage_countnonzeroinregion(cvImagePtr, x, y, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method copy(image:ofxCvImage)
		If ofxCvColorImage(image) Then
			bmx_ofx_ofxcvimage_copycolor(cvImagePtr, image.cvImagePtr)
		Else If ofxCvGrayscaleImage(image) Then
			bmx_ofx_ofxcvimage_copygray(cvImagePtr, image.cvImagePtr)
		End If
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type ofxCvColorImage Extends ofxCvImage

	Method New()
		cvImagePtr = bmx_ofx_ofxcvcolorimage_new()
	End Method

	Rem
	bbdoc: 
	End Rem
	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvcolorimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method
	
	Method Delete()
		If cvImagePtr Then
			bmx_ofx_ofxcvcolorimage_free(cvImagePtr)
			cvImagePtr = Null
		End If
	End Method

End Type

Rem
bbdoc: 
End Rem
Type ofxCvGrayscaleImage Extends ofxCvImage

	Method New()
		cvImagePtr = bmx_ofx_ofxcvgrayscaleimage_new()
	End Method

	Rem
	bbdoc: 
	End Rem
	Method absDiff(mom:ofxCvGrayscaleImage, dad:ofxCvGrayscaleImage = Null)
		If dad Then
			bmx_ofx_ofxcvgrayscaleimage_absdiff(cvImagePtr, mom.cvImagePtr, dad.cvImagePtr)
		Else
			bmx_ofx_ofxcvgrayscaleimage_absdiff(cvImagePtr, mom.cvImagePtr, Null)
		End If
	End Method

	Rem
	bbdoc: 
	End Rem
	Method threshold(value:Int, invert:Int = False)
		bmx_ofx_ofxcvgrayscaleimage_threshold(cvImagePtr, value, invert)
	End Method
	
	Rem
	bbdoc: 
	End Rem
    Method adaptiveThreshold(blockSize:Int, offset:Int = 0, invert:Int = False, gauss:Int = False)
		bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(cvImagePtr, blockSize, offset, invert, gauss)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvgrayscaleimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method

	Method Delete()
		If cvImagePtr Then
			bmx_ofx_ofxcvgrayscaleimage_free(cvImagePtr)
			cvImagePtr = Null
		End If
	End Method

End Type

Rem
bbdoc: 
End Rem
Type ofxCvContourFinder

	Field contourFinderPtr:Byte Ptr
	
	Field iter:ofxCvBlobIterator
	
	Method New()
		contourFinderPtr = bmx_ofx_ofxcvcontourfinder_new()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method findContours:Int(_input:ofxCvGrayscaleImage, minArea:Int, maxArea:Int, considered:Int, findHoles:Int, useApproximation:Int = True)
		Return bmx_ofx_ofxcvcontourfinder_findcontours(contourFinderPtr, _input.cvImagePtr, minArea, maxArea, considered, ..
			findHoles, useApproximation)
	End Method
	
	Rem
	bbdoc: Returns a blob iterator.
	about: Usually you don't need this, as you can use ofxCvContourFinder with Eachin :
	<pre>
	For Local blob:ofxCvBlob = EachIn contourFinder
	    ...
	Next
	</pre>
	End Rem
	Method getBlobs:ofxCvBlobIterator()
		Return ofxCvBlobIterator._create(bmx_ofx_ofxcvcontourfinder_getblobs(contourFinderPtr))
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method draw(x:Float, y:Float, w:Float = 0.0, h:Float = 0.0)
		bmx_ofx_ofxcvcontourfinder_draw(contourFinderPtr, x, y, w, h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getHeight:Float()
		Return bmx_ofx_ofxcvcontourfinder_getheight(contourFinderPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getWidth:Float()
		Return bmx_ofx_ofxcvcontourfinder_getwidth(contourFinderPtr)
	End Method

	Rem
	bbdoc: 
	End Rem
	Method setAnchorPercent(xPct:Float, yPct:Float)
		bmx_ofx_ofxcvcontourfinder_setanchorpercent(contourFinderPtr, xPct, yPct)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPoint(x:Int, y:Int)
		bmx_ofx_ofxcvcontourfinder_setanchorpoint(contourFinderPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method resetAnchor()
		bmx_ofx_ofxcvcontourfinder_resetanchor(contourFinderPtr)
	End Method

	Method ObjectEnumerator:ofxCvBlobIterator()
		If iter Then
			iter.Free()
		End If
		iter = ofxCvBlobIterator._create(bmx_ofx_ofxcvcontourfinder_getblobs(contourFinderPtr))
		Return iter
	End Method

	Rem
	bbdoc: 
	End Rem
	Method Free()
		If contourFinderPtr Then
			bmx_ofx_ofxcvcontourfinder_free(contourFinderPtr)
			contourFinderPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

End Type

Rem
bbdoc: 
End Rem
Type ofxCvBlobIterator

	Field iterPtr:Byte Ptr

	Function _create:ofxCvBlobIterator(iterPtr:Byte Ptr)
		If iterPtr Then
			Local this:ofxCvBlobIterator = New ofxCvBlobIterator
			this.iterPtr = iterPtr
			Return this
		End If
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method size:Int()
		Return bmx_ofx_ofxfvblobiterator_size(iterPtr)
	End Method
	
	Method HasNext:Int()
		Return bmx_ofx_ofxfvblobiterator_hasnext(iterPtr)
	End Method

	Method NextObject:Object()
		Return ofxCvBlob._create(bmx_ofx_ofxfvblobiterator_next(iterPtr))
	End Method

	Method Free()
		If iterPtr Then
			bmx_ofx_ofxfvblobiterator_free(iterPtr)
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
Type ofxCvBlob

	' blobs do not require freeing as they are handled internally by the library
	Field blobPtr:Byte Ptr

	Function _create:ofxCvBlob(blobPtr:Byte Ptr)
		If blobPtr Then
			Local this:ofxCvBlob = New ofxCvBlob
			this.blobPtr = blobPtr
			Return this
		End If
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method draw(x:Float = 0, y:Float = 0)
		bmx_ofx_ofxcvblob_draw(blobPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getArea:Float()
		Return bmx_ofx_ofxcvblob_getarea(blobPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getLength:Float()
		Return bmx_ofx_ofxcvblob_getlength(blobPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getBoundingRect(x:Float Var, y:Float Var, w:Float Var, h:Float Var)
		bmx_ofx_ofxcvblob_getboundingrect(blobPtr, Varptr x, Varptr y, Varptr w, Varptr h)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getCentroid(x:Float Var, y:Float Var)
		bmx_ofx_ofxcvblob_getcentroid(blobPtr, Varptr x, Varptr y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method isHole:Int()
		Return bmx_ofx_ofxcvblob_hole(blobPtr)
	End Method

End Type

Rem
bbdoc: 
End Rem
Type ofxCvHaarFinder
	
	Field haarPtr:Byte Ptr

	Field iter:ofxCvBlobIterator

	Method New()
		haarPtr = bmx_ofx_ofxcvhaarfinder_new()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setup(haarFile:String)
		bmx_ofx_ofxcvhaarfinder_setup(haarPtr, haarFile)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method ready:Int()
		Return bmx_ofx_ofxcvhaarfinder_ready(haarPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setScaleHaar(scaleHaar:Float)
		bmx_ofx_ofxcvhaarfinder_setscalehaar(haarPtr, scaleHaar)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setNeighbors(neighbors:Int)
		bmx_ofx_ofxcvhaarfinder_setneighbors(haarPtr, neighbors)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method findHaarObjects(img:ofxCvGrayscaleImage, minWidth:Int = HAAR_DEFAULT_MIN_SIZE, minHeight:Int = HAAR_DEFAULT_MIN_SIZE, ..
			x:Int = -1, y:Int = -1, w:Int = -1, h:Int = -1)
		bmx_ofx_ofxcvhaarfinder_findhaarobjects(haarPtr, img.cvImagePtr, minWidth, minHeight, x, y, w, h)
	End Method
	
	Method ObjectEnumerator:ofxCvBlobIterator()
		If iter Then
			iter.Free()
		End If
		iter = ofxCvBlobIterator._create(bmx_ofx_ofxcvhaarfinder_getblobs(haarPtr))
		Return iter
	End Method

	Rem
	bbdoc: 
	End Rem
	Method getWidth:Float()
		Return bmx_ofx_ofxcvhaarfinder_getwidth(haarPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method getHeight:Float()
		Return bmx_ofx_ofxcvhaarfinder_getheight(haarPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method Free()
		If haarPtr Then
			bmx_ofx_ofxcvhaarfinder_free(haarPtr)
			haarPtr = Null
		End If
	End Method

	Method Delete()
		Free()
	End Method
	
End Type


Type ofxCvOpticalFlow

	Field flowPtr:Byte Ptr
	
	Method allocate(w:Int, h:Int) Abstract
	
	Method getVelocity(x:Int, y:Int, vx:Float Var, vy:Float Var) Abstract
	
End Type

Type ofxCvOpticalFlowLK Extends ofxCvOpticalFlow

	Method New()
		flowPtr = bmx_ofx_ofxcvopticalflowlk_new()
	End Method

	Method allocate(w:Int, h:Int)
		bmx_ofx_ofxcvopticalflowlk_allocate(flowPtr, w, h)
	End Method
	
	Method getVelocity(x:Int, y:Int, vx:Float Var, vy:Float Var)
		bmx_ofx_ofxcvopticalflowlk_getvelocity(flowPtr, x, y, Varptr vx, Varptr vy)
	End Method
	
	Method calculateFlow(prev:ofxCvGrayscaleImage, curr:ofxCvGrayscaleImage)
		bmx_ofx_ofxcvopticalflowlk_calculateflow(flowPtr, prev.cvImagePtr, curr.cvImagePtr)
	End Method

End Type


