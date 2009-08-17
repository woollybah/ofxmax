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
Module ofx.ofxglmax2d

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."


Import ofx.core


Rem
bbdoc: 
End Rem
Type GLMax2DWindow Extends ofAppBaseWindow

	Field width:Int
	Field height:Int
	Field _mode:Int

	Method setupOpenGL(w:Int, h:Int, screenMode:Int)
		width = w
		height = h
		_mode = screenMode
	End Method
		
	Method initializeWindow()
		'DebugStop
		Local cols:Int = 0
		
		If _mode = OF_FULLSCREEN Then
			cols = 32
		End If
		
		Graphics width, height, cols
		SetBlend AlphaBlend
	End Method

	Method runAppViaInfiniteLoop(app:ofBaseApp)

		If app Then
			ofBaseApp._setup(app)
			ofBaseApp._update(app)
		End If

		While True
		
			PollSystem()
		
			Cls
			
			app.update()
			
			app.draw()
			
			Flip
		
		Wend
		
	End Method

	Method hideCursor()
		HideMouse
	End Method

	Method showCursor()
		ShowMouse
	End Method
	
	Method setWindowPosition(x:Int, y:Int)
	End Method

	Method setWindowShape(w:Int, h:Int)
	End Method
	
	Method getFrameNum:Int()
	End Method
	
	Method getFrameRate:Float()
	End Method

	Method setFrameRate(targetRate:Float)
	End Method
	
	Method getWindowPosition(x:Int Var, y:Int Var)
	End Method

	Method getWindowSize(w:Int Var, h:Int Var)
		w = width
		h = height
	End Method

	Method getScreenSize(w:Int Var, h:Int Var)
	End Method

	Method setWindowTitle(title:String)
	End Method
	
	Method getWindowMode:Int()
		Return _mode
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


