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
Function ofGetFrameRate:Float()
	Return bmx_ofx_ofGetFrameRate()
End Function

Rem
bbdoc: 
End Rem
Function ofGetFrameNum:Int()
	Return bmx_ofx_ofGetFrameNum()
End Function

Rem
bbdoc: 
End Rem
Function ofSetFrameRate(targetRate:Int)
	bmx_ofx_ofSetFrameRate(targetRate)
End Function

Rem
bbdoc: 
End Rem
Function ofSleepMillis(millis:Int)
	bmx_ofx_ofSleepMillis(millis)
End Function

Rem
bbdoc: 
End Rem
Function ofHideCursor()
	bmx_ofx_ofHideCursor()
End Function

Rem
bbdoc: 
End Rem
Function ofShowCursor()
	bmx_ofx_ofShowCursor()
End Function

Rem
bbdoc: 
End Rem
Function ofGetWindowPositionX:Int()
	Return bmx_ofx_ofGetWindowPositionX()
End Function

Rem
bbdoc: 
End Rem
Function ofGetWindowPositionY:Int()
	Return bmx_ofx_ofGetWindowPositionY()
End Function

Rem
bbdoc: 
End Rem
Function ofGetScreenWidth:Int()
	Return bmx_ofx_ofGetScreenWidth()
End Function

Rem
bbdoc: 
End Rem
Function ofGetScreenHeight:Int()
	Return bmx_ofx_ofGetScreenHeight()
End Function

Rem
bbdoc: 
End Rem
Function ofGetWindowMode:Int()	
	Return bmx_ofx_ofGetWindowMode()
End Function

Rem
bbdoc: 
End Rem
Function ofGetWidth:Int()
	Return bmx_ofx_ofGetWidth()
End Function

Rem
bbdoc: 
End Rem
Function ofGetHeight:Int()
	Return bmx_ofx_ofGetHeight()
End Function

Rem
bbdoc: 
End Rem
Function ofSetWindowPosition(x:Int, y:Int)
	bmx_ofx_ofSetWindowPosition(x, y)
End Function

Rem
bbdoc: 
End Rem
Function ofSetWindowShape(width:Int, height:Int)
	bmx_ofx_ofSetWindowShape(width, height)
End Function

Rem
bbdoc: 
End Rem
Function ofSetWindowTitle(title:String)
	bmx_ofx_ofSetWindowTitle(title)
End Function

Rem
bbdoc: 
End Rem
Function ofEnableSetupScreen()
	bmx_ofx_ofEnableSetupScreen()
End Function

Rem
bbdoc: 
End Rem
Function ofDisableSetupScreen()
	bmx_ofx_ofDisableSetupScreen()
End Function

Rem
bbdoc: 
End Rem
Function ofSetFullscreen(fullscreen:Int)
	bmx_ofx_ofSetFullscreen(fullscreen)
End Function

Rem
bbdoc: 
End Rem
Function ofToggleFullscreen()
	bmx_ofx_ofToggleFullscreen()
End Function

Rem
bbdoc: 
End Rem
Function ofSetVerticalSync(bSync:Int)
	bmx_ofx_ofSetVerticalSync(bSync)
End Function

