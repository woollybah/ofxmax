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

?macos
Import "-lOpenCV"
?linux
Import "-lcv"
Import "-lcxcore"
Import "-lcvaux"
?win32
Import "-lcv"
Import "-lcxcore"
Import "-lcvaux"
?

Import "source.bmx"


Extern

'	Function bmx_ofx_ofxcvimage_new:Byte Ptr()
	Function bmx_ofx_ofxcvimage_copycolor(handle:Byte Ptr, image:Byte Ptr)
	Function bmx_ofx_ofxcvimage_copygray(handle:Byte Ptr, image:Byte Ptr)
	Function bmx_ofx_ofxcvimage_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_ofx_ofxcvimage_setfrompixels(handle:Byte Ptr, pixels:Byte Ptr, w:Int, h:Int)
	Function bmx_ofx_ofxcvimage_allocate(handle:Byte Ptr, w:Int, h:Int)

	Function bmx_ofx_ofxcvcolorimage_new:Byte Ptr()
	Function bmx_ofx_ofxcvcolorimage_setfrompixels(handle:Byte Ptr, pixels:Byte Ptr, w:Int, h:Int)
	Function bmx_ofx_ofxcvcolorimage_free(handle:Byte Ptr)

	Function bmx_ofx_ofxcvgrayscaleimage_new:Byte Ptr()
	Function bmx_ofx_ofxcvgrayscaleimage_absdiff(handle:Byte Ptr, mom:Byte Ptr, dad:Byte Ptr)
	Function bmx_ofx_ofxcvgrayscaleimage_threshold(handle:Byte Ptr, value:Int, invert:Int)
	Function bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(handle:Byte Ptr, blockSize:Int, offset:Int, invert:Int, gauss:Int)
	Function bmx_ofx_ofxcvgrayscaleimage_setfrompixels(handle:Byte Ptr, pixels:Byte Ptr, w:Int, h:Int)
	Function bmx_ofx_ofxcvgrayscaleimage_free(handle:Byte Ptr)

	Function bmx_ofx_ofxcvcontourfinder_new:Byte Ptr()
	Function bmx_ofx_ofxcvcontourfinder_findcontours:Int(handle:Byte Ptr, _input:Byte Ptr, minArea:Int, maxArea:Int, ..
		considered:Int, findHoles:Int, useApproximation:Int)
	Function bmx_ofx_ofxcvcontourfinder_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_ofx_ofxcvcontourfinder_getblobs:Byte Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxcvcontourfinder_getheight:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxcvcontourfinder_getwidth:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxcvcontourfinder_setanchorpercent(handle:Byte Ptr, xPct:Float, yPct:Float)
	Function bmx_ofx_ofxcvcontourfinder_setanchorpoint(handle:Byte Ptr, x:Int, y:Int)
	Function bmx_ofx_ofxcvcontourfinder_resetanchor(handle:Byte Ptr)
	Function bmx_ofx_ofxcvcontourfinder_free(handle:Byte Ptr)

	Function bmx_ofx_ofxfvblobiterator_hasnext:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfvblobiterator_next:Byte Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxfvblobiterator_size:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxfvblobiterator_free(handle:Byte Ptr)

	Function bmx_ofx_ofxcvblob_draw(handle:Byte Ptr, x:Float, y:Float)
	Function bmx_ofx_ofxcvblob_getarea:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxcvblob_getlength:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxcvblob_getboundingrect(handle:Byte Ptr, x:Float Ptr, y:Float Ptr, w:Float Ptr, h:Float Ptr)
	Function bmx_ofx_ofxcvblob_getcentroid(handle:Byte Ptr, x:Float Ptr, y:Float Ptr)
	Function bmx_ofx_ofxcvblob_hole:Int(handle:Byte Ptr)

	Function bmx_ofx_ofxcvhaarfinder_new:Byte Ptr()
	Function bmx_ofx_ofxcvhaarfinder_setup(handle:Byte Ptr, haarFile:String)
	Function bmx_ofx_ofxcvhaarfinder_ready:Int(handle:Byte Ptr)
	Function bmx_ofx_ofxcvhaarfinder_setscalehaar(handle:Byte Ptr, scaleHaar:Float)
	Function bmx_ofx_ofxcvhaarfinder_setneighbors(handle:Byte Ptr, neighbors:Int)
	Function bmx_ofx_ofxcvhaarfinder_findhaarobjects:Int(handle:Byte Ptr, img:Byte Ptr, minWidth:Int, minHeight:Int, x:Int, y:Int, w:Int, h:Int)
	Function bmx_ofx_ofxcvhaarfinder_free(handle:Byte Ptr)
	Function bmx_ofx_ofxcvhaarfinder_getblobs:Byte Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxcvhaarfinder_getwidth:Float(handle:Byte Ptr)
	Function bmx_ofx_ofxcvhaarfinder_getheight:Float(handle:Byte Ptr)

End Extern


Const CV_INTER_NN:Int = 0
Const CV_INTER_LINEAR:Int = 1
Const CV_INTER_CUBIC:Int = 2
Const CV_INTER_AREA:Int = 3

Const CV_WARP_FILL_OUTLIERS:Int = 8
Const CV_WARP_INVERSE_MAP:Int = 16




Const CV_BGR2BGRA:Int = 0
Const CV_RGB2RGBA:Int = CV_BGR2BGRA

Const CV_BGRA2BGR:Int = 1
Const CV_RGBA2RGB:Int = CV_BGRA2BGR

Const CV_BGR2RGBA:Int = 2
Const CV_RGB2BGRA:Int = CV_BGR2RGBA

Const CV_RGBA2BGR:Int = 3
Const CV_BGRA2RGB:Int = CV_RGBA2BGR

Const CV_BGR2RGB:Int = 4
Const CV_RGB2BGR:Int = CV_BGR2RGB

Const CV_BGRA2RGBA:Int = 5
Const CV_RGBA2BGRA:Int = CV_BGRA2RGBA

Const CV_BGR2GRAY:Int = 6
Const CV_RGB2GRAY:Int = 7
Const CV_GRAY2BGR:Int = 8
Const CV_GRAY2RGB:Int = CV_GRAY2BGR
Const CV_GRAY2BGRA:Int = 9
Const CV_GRAY2RGBA:Int = CV_GRAY2BGRA
Const CV_BGRA2GRAY:Int = 10
Const CV_RGBA2GRAY:Int = 11

Const CV_BGR2BGR565:Int = 12
Const CV_RGB2BGR565:Int = 13
Const CV_BGR5652BGR:Int = 14
Const CV_BGR5652RGB:Int = 15
Const CV_BGRA2BGR565:Int = 16
Const CV_RGBA2BGR565:Int = 17
Const CV_BGR5652BGRA:Int = 18
Const CV_BGR5652RGBA:Int = 19

Const CV_GRAY2BGR565:Int = 20
Const CV_BGR5652GRAY:Int = 21

Const CV_BGR2BGR555:Int = 22
Const CV_RGB2BGR555:Int = 23
Const CV_BGR5552BGR:Int = 24
Const CV_BGR5552RGB:Int = 25
Const CV_BGRA2BGR555:Int = 26
Const CV_RGBA2BGR555:Int = 27
Const CV_BGR5552BGRA:Int = 28
Const CV_BGR5552RGBA:Int = 29

Const CV_GRAY2BGR555:Int = 30
Const CV_BGR5552GRAY:Int = 31

Const CV_BGR2XYZ:Int = 32
Const CV_RGB2XYZ:Int = 33
Const CV_XYZ2BGR:Int = 34
Const CV_XYZ2RGB:Int = 35

Const CV_BGR2YCrCb:Int = 36
Const CV_RGB2YCrCb:Int = 37
Const CV_YCrCb2BGR:Int = 38
Const CV_YCrCb2RGB:Int = 39

Const CV_BGR2HSV:Int = 40
Const CV_RGB2HSV:Int = 41

Const CV_BGR2Lab:Int = 44
Const CV_RGB2Lab:Int = 45

Const CV_BayerBG2BGR:Int = 46
Const CV_BayerGB2BGR:Int = 47
Const CV_BayerRG2BGR:Int = 48
Const CV_BayerGR2BGR:Int = 49

Const CV_BayerBG2RGB:Int = CV_BayerRG2BGR
Const CV_BayerGB2RGB:Int = CV_BayerGR2BGR
Const CV_BayerRG2RGB:Int = CV_BayerBG2BGR
Const CV_BayerGR2RGB:Int = CV_BayerGB2BGR

Const CV_BGR2Luv:Int = 50
Const CV_RGB2Luv:Int = 51
Const CV_BGR2HLS:Int = 52
Const CV_RGB2HLS:Int = 53

Const CV_HSV2BGR:Int = 54
Const CV_HSV2RGB:Int = 55

Const CV_Lab2BGR:Int = 56
Const CV_Lab2RGB:Int = 57
Const CV_Luv2BGR:Int = 58
Const CV_Luv2RGB:Int = 59
Const CV_HLS2BGR:Int = 60
Const CV_HLS2RGB:Int = 61

Const CV_COLORCVT_MAX:Int = 100

Const HAAR_DEFAULT_MIN_SIZE:Int = 0

