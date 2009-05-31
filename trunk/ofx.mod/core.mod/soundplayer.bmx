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


Function ofSoundStopAll()
	bmx_ofx_ofsoundplayer_ofSoundStopAll()
End Function

Function ofSoundSetVolume(vol:Float)
	bmx_ofx_ofsoundplayer_ofSoundSetVolume(vol)
End Function

Function ofSoundGetSpectrum:Float Ptr(bands:Int)
	Return bmx_ofx_ofsoundplayer_ofSoundGetSpectrum(bands)
End Function

Rem
bbdoc: 
End Rem
Type ofSoundPlayer

	Field soundplayerPtr:Byte Ptr
	
	Method New()
		soundplayerPtr = bmx_ofx_ofsoundplayer_new()
	End Method
	
	Method LoadSound(filename:String, stream:Int = False)
		bmx_ofx_ofsoundplayer_loadsound(soundplayerPtr, filename, stream)
	End Method
	
	Method unloadSound()
		bmx_ofx_ofsoundplayer_unloadsound(soundplayerPtr)
	End Method
	
	Method play()
		bmx_ofx_ofsoundplayer_play(soundplayerPtr)
	End Method
	
	Method stop()
		bmx_ofx_ofsoundplayer_stop(soundplayerPtr)
	End Method
	
	Method setVolume(vol:Float)
		bmx_ofx_ofsoundplayer_setvolume(soundplayerPtr, vol)
	End Method

	Method setPan(pan:Float)
		bmx_ofx_ofsoundplayer_setpan(soundplayerPtr, pan)
	End Method
	
	Method setSpeed(speed:Float)
		bmx_ofx_ofsoundplayer_setspeed(soundplayerPtr, speed)
	End Method
	
	Method setPaused(paused:Int)
		bmx_ofx_ofsoundplayer_setpaused(soundplayerPtr, paused)
	End Method
	
	Method setLoop(loop:Int)
		bmx_ofx_ofsoundplayer_setloop(soundplayerPtr, loop)
	End Method
	
	Method setMultiPlay(mp:Int)
		bmx_ofx_ofsoundplayer_setmultiplay(soundplayerPtr, mp)
	End Method
	
	Method setPosition(pct:Float)
		bmx_ofx_ofsoundplayer_setposition(soundplayerPtr, pct)
	End Method
	
	Method getPosition:Float()
		Return bmx_ofx_ofsoundplayer_getposition(soundplayerPtr)
	End Method
	
	Method getIsPlaying:Int()
		Return bmx_ofx_ofsoundplayer_getisplaying(soundplayerPtr)
	End Method
	
	Method getSpeed:Float()
		Return bmx_ofx_ofsoundplayer_getspeed(soundplayerPtr)
	End Method
	
	Method getPan:Float()
		Return bmx_ofx_ofsoundplayer_getpan(soundplayerPtr)
	End Method
	
End Type


