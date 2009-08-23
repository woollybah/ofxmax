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
Import "-lole32"
Import "-loleaut32"
Import "-luuid"
Import "-lSTRMBASE"
Import "-lPocoXMLmt"
Import "-lPocoFoundationmt"
Import "-lPocoNetmt"
Import "-lPocoUtilmt"
?linux
Import "-lPocoXML"
Import "-lPocoFoundation"
Import "-lPocoNet"
Import "-lPocoUtil"
'Import "-lGLee"
Import "-ldcam"
Import "-lunicap"
Import "-lv4l"
Import "-lv4l2cpi"
Import "-lvid21394"
Import "-loFappsink"
' NOTE - these really want to be acquired via pkg-config
Import "-lgstvideo-0.10"
Import "-lgstbase-0.10"
Import "-lgstreamer-0.10"
Import "-lgobject-2.0"
Import "-lgmodule-2.0"
Import "-lgthread-2.0"
Import "-lrt"
Import "-lxml2"
Import "-lglib-2.0"
Import "-lavcodec"
Import "-lavformat"
Import "-lavutil"
Import "-lswscale"
?

Import "source.bmx"


Extern
	Function bmx_of_ofrunapp(app:Byte Ptr)
	Function bmx_of_ofsetupopengl(window:Byte Ptr, w:Int, h:Int, screenMode:Int)

	Function bmx_of_ofbaseapp_new:Byte Ptr(handle:Object)
	Function bmx_of_ofbaseapp_keypressed(handle:Byte Ptr, key:Int)
	Function bmx_of_ofbaseapp_keyreleased(handle:Byte Ptr, key:Int)
	Function bmx_of_ofbaseapp_mousepressed(handle:Byte Ptr, button:Int, x:Int, y:Int)
	Function bmx_of_ofbaseapp_mousereleased(handle:Byte Ptr, button:Int, x:Int, y:Int)
	Function bmx_of_ofbaseapp_mousedragged(handle:Byte Ptr, x:Int, y:Int, buttonInUse:Int)
	Function bmx_of_ofbaseapp_mousemoved(handle:Byte Ptr, x:Int, y:Int)
	
	Function bmx_of_ofvideograbber_new:Byte Ptr()
	Function bmx_of_ofvideograbber_initgrabber:Int(handle:Byte Ptr, w:Int, h:Int, texture:Int)
	Function bmx_of_ofvideograbber_setverbose(handle:Byte Ptr, verbose:Int)
	Function bmx_of_ofvideograbber_grabframe(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_of_ofvideograbber_isframenew:Int(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_getpixels:Byte Ptr(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_videosettings(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_update(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_getheight:Float(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_getwidth:Float(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_setanchorpercent(handle:Byte Ptr, xPct:Float, yPct:Float)
	Function bmx_of_ofvideograbber_setanchorpoint(handle:Byte Ptr, x:Int, y:Int)
	Function bmx_of_ofvideograbber_resetanchor(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_setusetexture(handle:Byte Ptr, use:Int)
	Function bmx_of_ofvideograbber_setdeviceid(handle:Byte Ptr, deviceID:Int)
	Function bmx_of_ofvideograbber_listdevices(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_close(handle:Byte Ptr)
	Function bmx_of_ofvideograbber_free(handle:Byte Ptr)

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

	Function bmx_ofx_oftexture_new:Byte Ptr()

	Function bmx_ofx_oftruetypefont_new:Byte Ptr()
	Function bmx_ofx_oftruetypefont_loadfont(handle:Byte Ptr, filename:String, _fontSize:Int, antiAliased:Int, fullCharacterSet:Int, makeContours:Int)
	Function bmx_ofx_oftruetypefont_drawstring(handle:Byte Ptr, text:String, x:Float, y:Float)
	Function bmx_ofx_oftruetypefont_getlineheight:Float(handle:Byte Ptr)
	Function bmx_ofx_oftruetypefont_setlineheight(handle:Byte Ptr, height:Float)
	Function bmx_ofx_oftruetypefont_stringwidth:Float(handle:Byte Ptr, s:String)
	Function bmx_ofx_oftruetypefont_stringheight:Float(handle:Byte Ptr, s:String)
	Function bmx_ofx_oftruetypefont_getstringboundingbox(handle:Byte Ptr, s:String, x:Float, y:Float, bbX:Float Ptr, bbY:Float Ptr, bbW:Float Ptr, bbH:Float Ptr)
	Function bmx_ofx_oftruetypefont_drawstringasshapes(handle:Byte Ptr, s:String, x:Float, y:Float)
	Function bmx_ofx_oftruetypefont_countcharacters:Int(handle:Byte Ptr)
	Function bmx_ofx_oftruetypefont_free(handle:Byte Ptr)

	Function bmx_of_ofvideoplayer_new:Byte Ptr()
	Function bmx_of_ofvideoplayer_getpixels:Byte Ptr(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_close(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_update(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_of_ofvideoplayer_getheight:Float(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_getwidth:Float(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_setanchorpercent(handle:Byte Ptr, xPct:Float, yPct:Float)
	Function bmx_of_ofvideoplayer_setanchorpoint(handle:Byte Ptr, x:Int, y:Int)
	Function bmx_of_ofvideoplayer_resetanchor(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_loadmovie:Int(handle:Byte Ptr, name:String)
	Function bmx_of_ofvideoplayer_closemovie(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_idlemovie(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_play(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_stop(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_getspeed:Float(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_isloaded:Int(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_isframenew:Int(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_getposition:Float(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_getduration:Float(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_getismoviedone:Int(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_setposition(handle:Byte Ptr, pct:Float)
	Function bmx_of_ofvideoplayer_setvolume(handle:Byte Ptr, volume:Int)
	Function bmx_of_ofvideoplayer_setloopstate(handle:Byte Ptr, state:Int)
	Function bmx_of_ofvideoplayer_setspeed(handle:Byte Ptr, speed:Float)
	Function bmx_of_ofvideoplayer_setframe(handle:Byte Ptr, frame:Int)
	Function bmx_of_ofvideoplayer_setpaused(handle:Byte Ptr, pause:Int)
	Function bmx_of_ofvideoplayer_getcurrentframe:Int(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_gettotalnumframes:Int(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_firstframe(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_nextframe(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_previousframe(handle:Byte Ptr)
	Function bmx_of_ofvideoplayer_free(handle:Byte Ptr)

	Function bmx_of_image_new:Byte Ptr()
	Function bmx_of_image_allocate(handle:Byte Ptr, w:Int, h:Int, _type:Int)
	Function bmx_of_image_clear(handle:Byte Ptr)
	Function bmx_of_image_setusetexture(handle:Byte Ptr, use:Int)
	Function bmx_of_image_gettexturereference:Byte Ptr(handle:Byte Ptr)
	Function bmx_of_image_loadimage:Int(handle:Byte Ptr, fileName:String)
	Function bmx_of_image_saveimage(handle:Byte Ptr, fileName:String)
	Function bmx_of_image_getpixels:Byte Ptr(handle:Byte Ptr)
	Function bmx_of_image_setfrompixels(handle:Byte Ptr, pixels:Byte Ptr, w:Int, h:Int, newType:Int, orderIsRGB:Int)
	Function bmx_of_image_setimagetype(handle:Byte Ptr, _type:Int)
	Function bmx_of_image_resize(handle:Byte Ptr, newWidth:Int, newHeight:Int)
	Function bmx_of_image_grabscreen(handle:Byte Ptr, x:Int, y:Int, w:Int, h:Int)
	Function bmx_of_image_update(handle:Byte Ptr)
	Function bmx_of_image_setanchorpercent(handle:Byte Ptr, xPct:Float, yPct:Float)
	Function bmx_of_image_setanchorpoint(handle:Byte Ptr, x:Int, y:Int)
	Function bmx_of_image_resetanchor(handle:Byte Ptr)
	Function bmx_of_image_draw(handle:Byte Ptr, x:Float, y:Float, w:Float, h:Float)
	Function bmx_of_image_getheight:Float(handle:Byte Ptr)
	Function bmx_of_image_getwidth:Float(handle:Byte Ptr)
	Function bmx_of_image_free(handle:Byte Ptr)
	Function bmx_og_image_gettype:Int(handle:Byte Ptr)

	Function bmx_ofx_ofGetElapsedTimeMillis:Int()
	Function bmx_ofx_ofGetElapsedTimef:Float()
	Function bmx_ofx_ofResetElapsedTimeCounter()

	Function bmx_of_ofNormalize:Float(value:Float, _min:Float, _max:Float)
	Function bmx_of_ofMap:Float(value:Float, inputMin:Float, inputMax:Float, outputMin:Float, outputMax:Float)
	Function bmx_of_ofClamp:Float(value:Float, _min:Float, _max:Float)
	Function bmx_of_ofLerp:Float(start:Float, stop:Float, amt:Float)
	Function bmx_of_ofDist:Float(x1:Float, y1:Float, x2:Float, y2:Float)
	Function bmx_of_ofDistSquared:Float(x1:Float, y1:Float, x2:Float, y2:Float)
	Function bmx_of_ofSign:Int(n:Float)
	Function bmx_of_ofInRange:Int(t:Float, _min:Float, _max:Float)
	Function bmx_of_ofRadToDeg:Float(radians:Float)
	Function bmx_of_ofDegToRad:Float(degrees:Float)
	Function bmx_of_ofRandomWidth:Float()
	Function bmx_of_ofRandomHeight:Float()

End Extern

Const OF_WINDOW:Int = 0
Const OF_FULLSCREEN:Int = 1
Const OF_GAME_MODE:Int = 2

Const CIRC_RESOLUTION:Int = 22 ' 22 pts For a circle...

Const OF_RECTMODE_CORNER:Int = 0
Const OF_RECTMODE_CENTER:Int = 1

Const OF_IMAGE_GRAYSCALE:Int = $00
Const OF_IMAGE_COLOR:Int = $01
Const OF_IMAGE_COLOR_ALPHA:Int = $02
Const OF_IMAGE_UNDEFINED:Int = $03

Const OF_MAX_STYLE_HISTORY:Int = 32
Const OF_MAX_CIRCLE_PTS:Int = 1024

Const OF_POLY_WINDING_ODD:Int = 100130
Const OF_POLY_WINDING_NONZERO:Int = 100131
Const OF_POLY_WINDING_POSITIVE:Int = 100132
Const OF_POLY_WINDING_NEGATIVE:Int = 100133
Const OF_POLY_WINDING_ABS_GEQ_TWO:Int = 100134


Const TWO_PI:Double = 6.28318530717958647693:Double
Const M_TWO_PI:Double = 6.28318530717958647693:Double
Const FOUR_PI:Double = 12.56637061435917295385:Double
Const HALF_PI:Double = 1.57079632679489661923:Double
Const RAD_TO_DEG:Float = 57.2957795
