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

Import "texture.bmx"

Type ofImage
	
	Field imagePtr:Byte Ptr

	Method New()
		imagePtr = bmx_of_image_new()
	End Method
	
	Method allocate(w:Int, h:Int, _type:Int)
		bmx_of_image_allocate(imagePtr, w, h, _type)
	End Method
	
	Method clear()
		bmx_of_image_clear(imagePtr)
	End Method
	
	Method setUseTexture(use:Int)
		bmx_of_image_setusetexture(imagePtr, use)
	End Method
	
	Method getTextureReference:ofTexture()
		Return ofTexture._create(bmx_of_image_gettexturereference(imagePtr))
	End Method
	
	Method LoadImage:Int(fileName:String)
		Return bmx_of_image_loadimage(imagePtr, fileName)
	End Method
	
	Method saveImage(fileName:String)
		bmx_of_image_saveimage(imagePtr, fileName)
	End Method
	
	Method getPixels:Byte Ptr()
		Return bmx_of_image_getpixels(imagePtr)
	End Method
	
	Method setFromPixels(pixels:Byte Ptr, w:Int, h:Int, newType:Int, orderIsRGB:Int = True)
		bmx_of_image_setfrompixels(imagePtr, pixels, w, h, newType, orderIsRGB)
	End Method
	
	Method setImageType(_type:Int)
		bmx_of_image_setimagetype(imagePtr, _type)
	End Method
	
	Method resize(newWidth:Int, newHeight:Int)
		bmx_of_image_resize(imagePtr, newWIdth, newHeight)
	End Method
	
	Method grabScreen(x:Int, y:Int, w:Int, h:Int)
		bmx_of_image_grabscreen(imagePtr, x, y, w, h)
	End Method
	
	Method update()
		bmx_of_image_update(imagePtr)
	End Method
	
	Method setAnchorPercent(xPct:Float, yPct:Float)
		bmx_of_image_setanchorpercent(imagePtr, xPct, yPct)
	End Method
	
	Method setAnchorPoint(x:Int, y:Int)
		bmx_of_image_setanchorpoint(imagePtr, x, y)
	End Method
	
	Method resetAnchor()
		bmx_of_image_resetanchor(imagePtr)
	End Method
	
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0)
		bmx_of_image_draw(imagePtr, x, y, w, h)
	End Method


	Method getHeight:Float()
		Return bmx_of_image_getheight(imagePtr)
	End Method
	
	Method getWidth:Float()
		Return bmx_of_image_getwidth(imagePtr)
	End Method
	

End Type
