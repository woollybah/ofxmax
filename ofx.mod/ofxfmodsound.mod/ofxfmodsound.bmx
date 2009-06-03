SuperStrict

Module ofx.ofxFMODSound

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."




ModuleInfo "CC_OPTS: -fexceptions"


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


