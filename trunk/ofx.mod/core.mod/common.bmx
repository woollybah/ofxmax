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
Import "-lPocoXML"
Import "-lPocoFoundation"
Import "-lPocoNet"
Import "-lPocoUtil"
Import "-framework GLUT"
Import "-framework QuickTime"
Import "-framework AudioToolbox"
?win32
'Import "-lglut"
Import "-lole32"
Import "-loleaut32"
Import "-luuid"
Import "-lSTRMBASE"
Import "-lPocoXMLmt"
Import "-lPocoFoundationmt"
Import "-lPocoNetmt"
Import "-lPocoUtilmt"
?

Import "source.bmx"


Extern
	Function bmx_of_ofrunapp(app:Byte Ptr)
	Function bmx_of_ofsetupopengl(window:Byte Ptr, w:Int, h:Int, screenMode:Int)

	Function bmx_of_ofbaseapp_new:Byte Ptr(handle:Object)
	
	Function bmx_of_ofvideograbber_new:Byte Ptr()
	Function bmx_of_ofvideograbber_initgrabber:Int(handle:Byte Ptr, w:Int, h:Int, texture:Int)
	Function bmx_of_ofvideograbber_setverbose(handle:Byte Ptr, verbose:Int)
	Function bmx_of_ofvideograbber_grabframe(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_of_ofvideograbber_isframenew:Int(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_getpixels:Byte Ptr(handle:Byte Ptr)

	Function bmx_of_oftexture_new:Byte Ptr()
	Function bmx_of_oftexture_allocate(handle:Byte Ptr, w:Int, h:Int, internalGlDataType:Int)

	Function bmx_of_ofappbasewindow_new:Byte Ptr(handle:Object)


	Function bmx_ofx_ofBackground(r:Int, g:Int, b:Int)
	Function bmx_ofx_ofSetBackgroundAuto(bManual:Int)
	Function bmx_ofx_ofSetRectMode(_mode:Int)
	Function bmx_ofx_ofGetUsingArbTex:Int()
	Function bmx_ofx_ofEnableArbTex()
	Function bmx_ofx_ofDisableArbTex()
	Function bmx_ofx_ofbClearBg:Int()
	Function bmx_ofx_ofGetRectMode:Int()
	Function bmx_ofx_ofTriangle(x1:Float,y1:Float,x2:Float,y2:Float,x3:Float, y3:Float)
	Function bmx_ofx_ofCircle(x:Float, y:Float, radius:Float)
	Function bmx_ofx_ofEllipse(x:Float, y:Float, width:Float, height:Float)
	Function bmx_ofx_ofLine(x1:Float, y1:Float, x2:Float, y2:Float)
	Function bmx_ofx_ofRect(x1:Float, y1:Float, w:Float, h:Float)
	Function bmx_ofx_ofSetCircleResolution(res:Int)
	Function bmx_ofx_ofCurve(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	Function bmx_ofx_ofBezier(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	Function bmx_ofx_ofNoFill()
	Function bmx_ofx_ofFill()
	Function bmx_ofx_ofSetLineWidth(lineWidth:Float)
	Function bmx_ofx_ofSetColor(r:Int, g:Int, b:Int, a:Int)
	Function bmx_ofx_ofSetColorHex(hexColor:Int)
	Function bmx_ofx_ofEnableAlphaBlending()
	Function bmx_ofx_ofDisableAlphaBlending()
	Function bmx_ofx_ofEnableSmoothing()
	Function bmx_ofx_ofDisableSmoothing()
	Function bmx_ofx_ofPushMatrix()
	Function bmx_ofx_ofPopMatrix()
	Function bmx_ofx_ofTranslate(x:Float, y:Float, z:Float)
	Function bmx_ofx_ofScale(xAmnt:Float, yAmnt:Float, zAmnt:Float)
	Function bmx_ofx_ofRotate(degrees:Float, vecX:Float, vecY:Float, vecZ:Float)
	Function bmx_ofx_ofRotateX(degrees:Float)
	Function bmx_ofx_ofRotateY(degrees:Float)
	Function bmx_ofx_ofRotateZ(degrees:Float)
	Function bmx_ofx_ofRotateDegrees(degrees:Float)
	Function bmx_ofx_ofDrawBitmapString(text:String, x:Float, y:Float)
	Function bmx_ofx_ofSetupGraphicDefaults()
	Function bmx_ofx_ofSetupScreen()
	Function bmx_ofx_ofCurveVertex(x:Float, y:Float)
	Function bmx_ofx_ofBezierVertex(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	Function bmx_ofx_ofSetPolyMode(_mode:Int)
	Function bmx_ofx_ofBeginShape()
	Function bmx_ofx_ofVertex(x:Float, y:Float)
	Function bmx_ofx_ofEndShape(bClose:Int)
	Function bmx_ofx_ofNextContour(bClose:Int)

	Function bmx_ofx_ofGetFrameRate:Float()
	Function bmx_ofx_ofGetFrameNum:Int()
	Function bmx_ofx_ofSetFrameRate(targetRate:Int)
	Function bmx_ofx_ofSleepMillis(millis:Int)
	Function bmx_ofx_ofHideCursor()
	Function bmx_ofx_ofShowCursor()
	Function bmx_ofx_ofGetWindowPositionX:Int()
	Function bmx_ofx_ofGetWindowPositionY:Int()
	Function bmx_ofx_ofGetScreenWidth:Int()
	Function bmx_ofx_ofGetScreenHeight:Int()
	Function bmx_ofx_ofGetWindowMode:Int()
	Function bmx_ofx_ofGetWidth:Int()
	Function bmx_ofx_ofGetHeight:Int()
	Function bmx_ofx_ofSetWindowPosition(x:Int, y:Int)
	Function bmx_ofx_ofSetWindowShape(width:Int, height:Int)
	Function bmx_ofx_ofSetWindowTitle(title:String)
	Function bmx_ofx_ofEnableSetupScreen()
	Function bmx_ofx_ofDisableSetupScreen()
	Function bmx_ofx_ofSetFullscreen(fullscreen:Int)
	Function bmx_ofx_ofToggleFullscreen()
	Function bmx_ofx_ofSetVerticalSync(bSync:Int)

	Function bmx_ofx_ofsoundplayer_new:Byte Ptr()
	Function bmx_ofx_ofsoundplayer_loadsound(handle:Byte Ptr, filename:String, stream:Int)
	Function bmx_ofx_ofsoundplayer_play(handle:Byte Ptr)
	Function bmx_ofx_ofsoundplayer_setvolume(handle:Byte Ptr, vol:Float)
	Function bmx_ofx_ofsoundplayer_unloadsound(handle:Byte Ptr)

	Function bmx_ofx_ofsoundplayer_stop(handle:Byte Ptr)
	Function bmx_ofx_ofsoundplayer_setpan(handle:Byte Ptr, pan:Float)
	Function bmx_ofx_ofsoundplayer_setspeed(handle:Byte Ptr, speed:Float)
	Function bmx_ofx_ofsoundplayer_setpaused(handle:Byte Ptr, paused:Int)
	Function bmx_ofx_ofsoundplayer_setloop(handle:Byte Ptr, loop:Int)
	Function bmx_ofx_ofsoundplayer_setmultiplay(handle:Byte Ptr, mp:Int)
	Function bmx_ofx_ofsoundplayer_setposition(handle:Byte Ptr, pct:Float)
	Function bmx_ofx_ofsoundplayer_getposition:Float(handle:Byte Ptr)
	Function bmx_ofx_ofsoundplayer_getisplaying:Int(handle:Byte Ptr)
	Function bmx_ofx_ofsoundplayer_getspeed:Float(handle:Byte Ptr)
	Function bmx_ofx_ofsoundplayer_getpan:Float(handle:Byte Ptr)

		
	Function bmx_ofx_ofsoundplayer_ofSoundStopAll()
	Function bmx_ofx_ofsoundplayer_ofSoundSetVolume(vol:Float)
	Function bmx_ofx_ofsoundplayer_ofSoundGetSpectrum:Float Ptr(bands:Int)

	Function bmx_ofx_oftexture_new:Byte Ptr()

	Function bmx_ofx_oftruetypefont_new:Byte Ptr()
	Function bmx_ofx_oftruetypefont_loadfont(handle:Byte Ptr, filename:String, _fontSize:Int, antiAliased:Int, fullCharacterSet:Int, makeContours:Int)
	Function bmx_ofx_oftruetypefont_drawstring(handle:Byte Ptr, text:String, x:Float, y:Float)

End Extern


Const OF_WINDOW:Int = 0
Const OF_FULLSCREEN:Int = 1
Const OF_GAME_MODE:Int = 2

Const CIRC_RESOLUTION:Int = 22 ' 22 pts For a circle...
