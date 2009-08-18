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
	
	Method allocate(w:Int, h:Int, _type:Int = OF_IMAGE_COLOR_ALPHA)
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
	
	Method LoadImage:Int(fileName:String, _type:Int = OF_IMAGE_COLOR_ALPHA)
		Local ret:Int = bmx_of_image_loadimage(imagePtr, fileName)
		If ret Then
			' convert image to requested type
			setImageType(_type)
		End If
		Return ret
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
	
	Method getType:Int()
		Return bmx_og_image_gettype(imagePtr)
	End Method
	
	Method copy(src:ofImage, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, dw:Int, dh:Int, _mode:Int = 0)
		If getType() <> OF_IMAGE_COLOR_ALPHA Or src.getType() <> OF_IMAGE_COLOR_ALPHA Then
			DebugLog "Both images must be 32-bit"
			Return
		End If
	
		Local sx2:Int = sx + sw
		Local sy2:Int = sy + sh
		Local dx2:Int = dx + dw
		Local dy2:Int = dy + dh
		
      	blit_resize(src, sx, sy, sx2, sy2, Int Ptr(getPixels()), getWidth(), getHeight(), dx, dy, dx2, dy2, _mode);
	End Method

	Method blit_resize(img:ofImage, srcX1:Int, srcY1:Int, srcX2:Int, srcY2:Int, destPixels:Int Ptr, ..
			screenW:Int, screenH:Int, destX1:Int, destY1:Int, destX2:Int, destY2:Int, _mode:Int)
			
		If srcX1 < 0 Then
			srcX1 = 0
		End If
		
		If srcY1 < 0 Then
			srcY1 = 0
		End If
		
		If srcX2 >= img.getWidth() Then
			srcX2 = img.getWidth() - 1
		End If
		
		If srcY2 >= img.getHeight() Then
			srcY2 = img.getHeight() - 1
		End If
		
		Local srcW:Int = srcX2 - srcX1
		Local srcH:Int = srcY2 - srcY1
		Local destW:Int = destX2 - destX1
		Local destH:Int = destY2 - destY1

		If destW <= 0 Or destH <= 0 Or srcW <= 0 Or srcH <= 0 Or destX1 >= screenW Or destY1 >= screenH Or ..
				srcX1 >= img.getWidth() Or srcY1 >= img.getHeight() Then
			Return
		End If
		
		Local dx:Int = (srcW / Float(destW) * 32768)
		Local dy:Int = (srcH / Float(destH) * 32768)
		
		Local srcXOffset:Int
		If destX1 < 0 Then
			srcXOffset = -destX1 * dx
		Else
			srcXOffset = srcX1 * 32768
		End If
		
		Local srcYOffset:Int
		If destY1 < 0 Then
			srcYOffset = -destY1 * dy
		Else
			srcYOffset = srcY1 * 32768
		End If
		
		If destX1 < 0 Then
			destW :+ destX1
			destX1 = 0
		End If
		
		If destY1 < 0 Then
			destH :+ destY1
			destY1 = 0
		End If
		
		destW = Min(destW, screenW - destX1)
		destH = Min(destH, screenH - destY1)
		
		Local destOffset:Int = destY1 * screenW + destX1
		Local srcBuffer:Int Ptr = Int Ptr(img.getPixels())

		Local iw:Int = img.getWidth()
		Local iw1:Int = iw - 1
		Local ih1:Int = img.getHeight() - 1
		
		Local a:Int, r:Int, g:Int, b:Int, sX:Int, fracV:Int, v1:Int, v2:Int, ifU:Int, ifV:Int, fracU:Int
		Local ul:Int, ll:Int, ur:Int, lr:Int, u1:Int, u2:Int, cUL:Int, cUR:Int, cLL:Int, cLR:Int
		Const RED_MASK:Int = $FF0000
		Const GREEN_MASK:Int = $FF00
		Const BLUE_MASK:Int = $FF
		Const ALPHA_MASK:Int = $FF000000
		
		Select _mode
			Case 0
				For Local y:Int = 0 Until destH
					'
					sX = srcXOffset
					fracV = srcYOffset & 32767
					ifV = 32767 - fracV
					v1 = (srcYOffset Shr 15) * iw
					v2 = Min((srcYOffset Shr 15) + 1, ih1) * iw
					
					'
					For Local x:Int = 0 Until destW
					
						fracU = sX & 32767
						ifU = 32767 - fracU
						ul = (ifU * ifV) Shr 15
						ll = (ifU * fracV) Shr 15
						ur = (fracU * ifV) Shr 15
						lr = (fracU * fracV) Shr 15
						u1 = (sX Shr 15)
						u2 = Min(u1 + 1, iw1)
						
						' get color values of the 4 neighbouring texels
						cUL = srcBuffer[v1 + u1]
						cUR = srcBuffer[v1 + u2]
						cLL = srcBuffer[v2 + u1]
						cLR = srcBuffer[v2 + u2]
						
						r = ((ul*((cUL&RED_MASK) Shr 16) + ll*((cLL&RED_MASK) Shr 16) + ..
							ur*((cUR&RED_MASK) Shr 16) + lr*((cLR&RED_MASK) Shr 16)) Shl 1) & RED_MASK
						
						g = ((ul*(cUL&GREEN_MASK) + ll*(cLL&GREEN_MASK) + ur*(cUR&GREEN_MASK) + ..
							lr*(cLR&GREEN_MASK)) Shr 15) & GREEN_MASK
						
						b = (ul*(cUL & BLUE_MASK) + ll*(cLL & BLUE_MASK) + ur*(cUR & BLUE_MASK) + ..
							lr*(cLR & BLUE_MASK)) Shr 15
						
						a = ((ul*((cUL&ALPHA_MASK) Shr 24) + ll*((cLL&ALPHA_MASK) Shr 24) + ..
							ur*((cUR&ALPHA_MASK) Shr 24) + lr*((cLR&ALPHA_MASK) Shr 24)) Shl 9) & ALPHA_MASK

						destPixels[destOffset + x] = r | g | b | a
						sX :+ dx
					Next

					destOffset :+ screenW
					srcYOffset :+ dy
				Next
		End Select
		

	End Method
End Type
