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
Module ofx.core

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."




ModuleInfo "CC_OPTS: -fexceptions"
ModuleInfo "CC_OPTS: -DPNG_iTXt_SUPPORTED -DHAVE_PROTOTYPES -DFREEIMAGE_LIB -DOPJ_STATIC" ' for freeimage

?macos
ModuleInfo "LD_OPTS: %PWD%/libs/GLee/lib/mac/GLee.a"
ModuleInfo "LD_OPTS: %PWD%/libs/rtAudio/lib/mac/rtAudio.a"
ModuleInfo "LD_OPTS: -L%PWD%/libs/poco/lib/mac/"
?win32
ModuleInfo "LD_OPTS: %PWD%/libs/GLee/lib/win32/GLee.lib"
ModuleInfo "LD_OPTS: %PWD%/libs/rtAudio/lib/win32/rtAudio.a"
ModuleInfo "LD_OPTS: -L%PWD%/libs/poco/lib/win32/"
ModuleInfo "LD_OPTS: %PWD%/libs/videoInput/lib/videoInputLib.a"
ModuleInfo "LD_OPTS: %PWD%/libs/quicktime/Libraries/qtmlClient.lib"
ModuleInfo "LD_OPTS: %PWD%/libs/quicktime/Libraries/Rave.lib"
ModuleInfo "LD_OPTS: %PWD%/libs/quicktime/Libraries/QTSClient.lib"
ModuleInfo "LD_OPTS: -L%PWD%/libs/dx/lib/"
?linux
ModuleInfo "LD_OPTS: -L%PWD%/libs/poco/lib/linux/"
ModuleInfo "LD_OPTS: -L%PWD%/libs/GLee/lib/linux/"
ModuleInfo "LD_OPTS: -L%PWD%/libs/rtAudio/lib/linux/"
ModuleInfo "LD_OPTS: -L%PWD%/libs/unicap/lib"
ModuleInfo "LD_OPTS: -L%PWD%/libs/gstappsink/lib"
?

Import "graphics.bmx"
Import "apprunner.bmx"
'Import "soundplayer.bmx"
Import "truetypefont.bmx"
Import "video.bmx"
Import "utils.bmx"
Import "common.bmx"

'
' BUILD NOTES :
'
' ofAppRunner.cpp
'   Removed references to ofAppGlutWindow since we don't want to require the dll for Win32.
'

Rem
bbdoc: 
End Rem
Function ofRunApp(app:ofBaseApp)
	Global _app:ofBaseApp
	_app = app
	bmx_of_ofrunapp(app.appPtr)
End Function

Rem
bbdoc: 
End Rem
Function ofSetupOpenGL(window:ofAppBaseWindow, w:Int, h:Int, screenMode:Int)
	bmx_of_ofsetupopengl(window.windowPtr, w, h, screenMode)
	ofSetBackgroundAuto(False)
End Function

Rem
bbdoc: 
End Rem
Type ofBaseApp

	Field appPtr:Byte Ptr

	Method New()
		appPtr = bmx_of_ofbaseapp_new(Self)
		AddHook EmitEventHook,Hook,Self,0
	End Method

	Rem
	bbdoc: 
	End Rem
	Method setup()
	End Method
	
	Function _setup(app:ofBaseApp)
		app.setup()
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method update()
	End Method

	Function _update(app:ofBaseApp)
		app.update()
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method draw()
	End Method

	Function _draw(app:ofBaseApp)
		app.draw()
	End Function
	
	Rem
	bbdoc: 
	End Rem
	Method keyPressed(key:Int)
	End Method

	Function _keyPressed(app:ofBaseApp, key:Int)
		app.keyPressed(key)
	End Function
	
	Method keyReleased(key:Int)
	End Method

	Function _keyReleased(app:ofBaseApp, key:Int)
		app.keyReleased(key)
	End Function
	
	Method mouseMoved(x:Int, y:Int)
	End Method
	
	Function _mouseMoved(app:ofBaseApp, x:Int, y:Int)
		app.mouseMoved(x, y)
	End Function
	
	Method mouseDragged(x:Int, y:Int, button:Int)
	End Method

	Function _mouseDragged(app:ofBaseApp, x:Int, y:Int, button:Int)
		app.mouseDragged(x, y, button)
	End Function
	
	Method mousePressed(x:Int, y:Int, button:Int)
	End Method

	Function _mousePressed(app:ofBaseApp, x:Int, y:Int, button:Int)
		app.mousePressed(x, y, button)
	End Function
	
	Method mouseReleased(x:Int, y:Int, button:Int)
	End Method
	
	Function _mouseReleased(app:ofBaseApp, x:Int, y:Int, button:Int)
		app.mouseReleased(x, y, button)
	End Function
	
	Method windowResized(w:Int, h:Int)
	End Method

	Function _windowResized(app:ofBaseApp, w:Int, h:Int)
		app.windowResized(w, h)
	End Function
	
	
	
	Global keyStates:Int[256],keyHits:Int[256]
	Global mouseStates:Int[4],mouseHits:Int[4],mouseLocation:Int[4]
	Global mouseState:Int, lastMouseDown:Int
	Global charGet:Int,charPut:Int,charQueue:Int[256]
	
	Function Hook:Object( id:Int,data:Object,context:Object )
	
		Local ev:TEvent=TEvent(data)
		If Not ev Return data
		
		Select ev.id
		Case EVENT_KEYDOWN
			If Not keyStates[ev.data]
				keyStates[ev.data]=1
				keyHits[ev.data]:+1
				
				bmx_of_ofbaseapp_keypressed(ofBaseApp(context).appPtr, ev.data)
			EndIf
		Case EVENT_KEYUP
			keyStates[ev.data]=0
			
			bmx_of_ofbaseapp_keyreleased(ofBaseApp(context).appPtr, ev.data)
		Case EVENT_KEYCHAR
			If charPut-charGet<256
				charQueue[charPut & 255]=ev.data
				charPut:+1
			EndIf
		Case EVENT_MOUSEDOWN
			If Not mouseStates[ev.data]
				mouseStates[ev.data]=1
				mouseHits[ev.data]:+1

				mouseState :| (1 Shl ev.data)
				lastMouseDown = ev.data

				bmx_of_ofbaseapp_mousepressed(ofBaseApp(context).appPtr, ev.data, ev.x, ev.y)
			EndIf
		Case EVENT_MOUSEUP
			mouseStates[ev.data]=0

			mouseState :~ (1 Shl ev.data)

			bmx_of_ofbaseapp_mousereleased(ofBaseApp(context).appPtr, ev.data, ev.x, ev.y)
		Case EVENT_MOUSEMOVE
			mouseLocation[0]=ev.x
			mouseLocation[1]=ev.y
			
			If mouseState > 0 Then
				bmx_of_ofbaseapp_mousedragged(ofBaseApp(context).appPtr, ev.x, ev.y, lastMouseDown)
			Else
				bmx_of_ofbaseapp_mousemoved(ofBaseApp(context).appPtr, ev.x, ev.y)
			End If
			
		Case EVENT_MOUSEWHEEL
			mouseLocation[2]:+ev.data
		End Select
	
		Return data
	
	End Function

End Type

Rem
bbdoc: 
End Rem
Type ofAppBaseWindow
	
	Field windowPtr:Byte Ptr
	
	Method New()
		windowPtr = bmx_of_ofappbasewindow_new(Self)
	End Method

	Method setupOpenGL(w:Int, h:Int, screenMode:Int) 
	End Method
	
	Function _setupOpenGL(window:ofAppBaseWindow, w:Int, h:Int, screenMode:Int)
		window.setupOpenGL(w, h, screenMode)
	End Function
	
	Method initializeWindow()
	End Method
	
	Function _initializeWindow(window:ofAppBaseWindow)
		window.initializeWindow()
	End Function
	
	Method runAppViaInfiniteLoop(app:ofBaseApp)
	End Method

	Function _runAppViaInfiniteLoop(window:ofAppBaseWindow, app:ofBaseApp)
		window.runAppViaInfiniteLoop(app)
	End Function
	
	Method hideCursor() 
	End Method

	Function _hideCursor(window:ofAppBaseWindow)
		window.hideCursor()
	End Function
	
	Method showCursor() 
	End Method
	
	Function _showCursor(window:ofAppBaseWindow)
		window.showCursor()
	End Function

	Method setWindowPosition(x:Int, y:Int)
	End Method
	
	Function _setWindowPosition(window:ofAppBaseWindow, x:Int, y:Int)
		window.setWindowPosition(x, y)
	End Function

	Method setWindowShape(w:Int, h:Int)
	End Method
	
	Function _setWindowShape(window:ofAppBaseWindow, w:Int, h:Int)
		window.setWindowShape(w, h)
	End Function

	Method getFrameNum:Int()
	End Method
	
	Function _getFrameNum:Int(window:ofAppBaseWindow)
		Return window.getFrameNum()
	End Function

	Method getFrameRate:Float()
	End Method

	Function _getFrameRate:Float(window:ofAppBaseWindow)
		Return window.getFrameRate()
	End Function
	
	Method getWindowPosition(x:Int Var, y:Int Var)
	End Method

	Function _getWindowPosition(window:ofAppBaseWindow, x:Int Var, y:Int Var)
		window.getWindowPosition(x, y)
	End Function

	Method getWindowSize(w:Int Var, h:Int Var)
	End Method

	Function _getWindowSize(window:ofAppBaseWindow, w:Int Ptr, h:Int Ptr)
		Local _w:Int, _h:Int
		window.getWindowSize(_w, _h)
		w[0] = _w
		h[0] = _h
	End Function

	Method getScreenSize(w:Int Var, h:Int Var)
	End Method

	Method setFrameRate(targetRate:Float)
	End Method
	
	Method setWindowTitle(title:String)
	End Method
	
	Method getWindowMode:Int()
	End Method
	
	Method setFullscreen(fullscreen:Int)
	End Method
	
	Method toggleFullscreen()
	End Method
	
	Method enableSetupScreen()
	End Method
	
	Method disableSetupScreen()
	End Method

End Type


