SuperStrict


Import "source.bmx"


Extern


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


End Extern

