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

Import "common.bmx"

Rem
bbdoc: 
End Rem
Type ofTrueTypeFont

	Field fontPtr:Byte Ptr
	
	Method New()
		fontPtr = bmx_ofx_oftruetypefont_new()
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method loadFont(filename:String, _fontSize:Int, antiAliased:Int = True, fullCharacterSet:Int = False, makeContours:Int = False)
		bmx_ofx_oftruetypefont_loadfont(fontPtr, filename, _fontSize, antiAliased, fullCharacterSet, makeContours)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method drawString(text:String, x:Float, y:Float)
		bmx_ofx_oftruetypefont_drawstring(fontPtr, text, x, y)
	End Method

	Method getLineHeight:Float()
		Return bmx_ofx_oftruetypefont_getlineheight(fontPtr)
	End Method
	
	Method setLineHeight(height:Float)
		bmx_ofx_oftruetypefont_setlineheight(fontPtr, height)
	End Method
	
	Method stringWidth:Float(s:String)
		Return bmx_ofx_oftruetypefont_stringwidth(fontPtr, s)
	End Method
	
	Method stringHeight:Float(s:String)
		Return bmx_ofx_oftruetypefont_stringheight(fontPtr, s)
	End Method
	
	Method getStringBoundingBox(s:String, x:Float, y:Float, bbX:Float Var, bbY:Float Var, bbW:Float Var, bbH:Float Var)
		bmx_ofx_oftruetypefont_getstringboundingbox(fontPtr, s, x, y, Varptr bbX, Varptr bbY, Varptr bbW, Varptr bbH)
	End Method
	
	Method drawStringAsShapes(s:String, x:Float, y:Float)
		bmx_ofx_oftruetypefont_drawstringasshapes(fontPtr, s, x, y)
	End Method
	
	Method countCharacters:Int()
		Return bmx_ofx_oftruetypefont_countcharacters(fontPtr)
	End Method

	'Method getCharacterAsPoints(character:Int)
	'End Method

End Type


