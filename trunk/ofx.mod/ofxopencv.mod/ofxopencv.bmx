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



Type ofxCvImage

	Field cvImagePtr:Byte Ptr
	
	'Method New()
	'	cvImagePtr = bmx_ofx_ofxcvimage_new()
	'End Method
	
	Method allocate(w:Int, h:Int)
		bmx_ofx_ofxcvimage_allocate(cvImagePtr, w, h)
	End Method
	
	Method clear()
	End Method
	
	Method getWidth:Float()
	End Method
	
	Method getHeight:Float()
	End Method
	
	Method setUseTexture(use:Int)
	End Method
	
	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method
	
	Method getPixels:Byte Ptr()
	End Method
	
	Method draw(x:Float, y:Float, w:Float = 0.0, h:Float = 0.0)
		bmx_ofx_ofxcvimage_draw(cvImagePtr, x, y, w, h)
	End Method
	
	Method setAnchorPercent(xPct:Float, yPct:Float)
	End Method
	
	Method setAnchorPoint(x:Int, y:Int)
	End Method
	
	Method resetAnchor()
	End Method
	
	Method erode()
	End Method
	
	Method dilate()
	End Method
	
	Method blur(value:Int = 3)
	End Method
	
	Method blurGaussian(value:Int = 3)
	End Method
	
	Method invert()
	End Method
	
	Method contrastStretch()
	End Method
	
	Method convertToRange(_min:Float, _max:Float)
	End Method
	
	Method resize(w:Int, h:Int)
	End Method
	
	Method scaleIntoMe(mom:ofxCvImage, interpolationMethod:Int = CV_INTER_NN)
	End Method
	
	Method mirror(bFlipVertically:Int, bFlipHorizontally:Int)
	End Method
	
	Method translate(x:Float, y:Float)
	End Method
	
	Method rotate(angle:Float, centerX:Float, centerY:Float)
	End Method
	
	Method scale(scaleX:Float, sclaeY:Float)
	End Method
	
	Method transform(angle:Float, centerX:Float, centerY:Float, scaleX:Float, scaleY:Float, moveX:Float, moveY:Float)
	End Method

	Method undistort(radialDistX:Float, radialDistY:Float, tangentDistX:Float, tangentDistY:Float, focalX:Float, ..
			focalY:Float, centerX:Float, centerY:Float)
	End Method

	'Method warpPerspective( Const ofPoint& A, Const ofPoint& B,
    '                               Const ofPoint& C, Const ofPoint& D );
	'Method warpIntoMe(mom:ofxCvImage, ofPoint src[4], Const ofPoint dst[4] );

	
	Method countNonZeroInRegion:Int(x:Int, y:Int, w:Int, h:Int)
	End Method
	
	Method copy(image:ofxCvImage)
		If ofxCvColorImage(image) Then
			bmx_ofx_ofxcvimage_copycolor(cvImagePtr, image.cvImagePtr)
		Else If ofxCvGrayscaleImage(image) Then
			bmx_ofx_ofxcvimage_copygray(cvImagePtr, image.cvImagePtr)
		End If
	End Method
	
End Type

Type ofxCvColorImage Extends ofxCvImage

	Method New()
		cvImagePtr = bmx_ofx_ofxcvcolorimage_new()
	End Method

	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvcolorimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method

End Type


Type ofxCvGrayscaleImage Extends ofxCvImage

	Method New()
		cvImagePtr = bmx_ofx_ofxcvgrayscaleimage_new()
	End Method

	Method absDiff(mom:ofxCvGrayscaleImage, dad:ofxCvGrayscaleImage = Null)
		If dad Then
			bmx_ofx_ofxcvgrayscaleimage_absdiff(cvImagePtr, mom.cvImagePtr, dad.cvImagePtr)
		Else
			bmx_ofx_ofxcvgrayscaleimage_absdiff(cvImagePtr, mom.cvImagePtr, Null)
		End If
	End Method

	Method threshold(value:Int, invert:Int = False)
		bmx_ofx_ofxcvgrayscaleimage_threshold(cvImagePtr, value, invert)
	End Method
	
    Method adaptiveThreshold(blockSize:Int, offset:Int = 0, invert:Int = False, gauss:Int = False)
		bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(cvImagePtr, blockSize, offset, invert, gauss)
	End Method

	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int)
		bmx_ofx_ofxcvgrayscaleimage_setfrompixels(cvImagePtr, pixels, w, h)
	End Method

End Type


Type ofxCvContourFinder

	Field contourFinderPtr:Byte Ptr
	
	Method New()
		contourFinderPtr = bmx_ofx_ofxcvcontourfinder_new()
	End Method
	
	Method findContours:Int(_input:ofxCvGrayscaleImage, minArea:Int, maxArea:Int, considered:Int, findHoles:Int, useApproximation:Int = True)
		Return bmx_ofx_ofxcvcontourfinder_findcontours(contourFinderPtr, _input.cvImagePtr, minArea, maxArea, considered, ..
			findHoles, useApproximation)
	End Method
	
	Method draw(x:Float, y:Float, w:Float = 0.0, h:Float = 0.0)
		bmx_ofx_ofxcvcontourfinder_draw(contourFinderPtr, x, y, w, h)
	End Method
	

End Type


