#include "ofMain.h"
#include "ofFMODSoundPlayer.h"

extern "C" {

#include "blitz.h"

	ofSoundPlayer * bmx_ofx_ofsoundplayer_new();
	void bmx_ofx_ofsoundplayer_loadsound(ofSoundPlayer * player, BBString * filename, int stream);
	void bmx_ofx_ofsoundplayer_play(ofSoundPlayer * player);
	void bmx_ofx_ofsoundplayer_setvolume(ofSoundPlayer * player, float vol);
	void bmx_ofx_ofsoundplayer_unloadsound(ofSoundPlayer * player);

	void bmx_ofx_ofsoundplayer_stop(ofSoundPlayer * player);
	void bmx_ofx_ofsoundplayer_setpan(ofSoundPlayer * player, float pan);
	void bmx_ofx_ofsoundplayer_setspeed(ofSoundPlayer * player, float speed);
	void bmx_ofx_ofsoundplayer_setpaused(ofSoundPlayer * player, int paused);
	void bmx_ofx_ofsoundplayer_setloop(ofSoundPlayer * player, int loop);
	void bmx_ofx_ofsoundplayer_setmultiplay(ofSoundPlayer * player, int mp);
	void bmx_ofx_ofsoundplayer_setposition(ofSoundPlayer * player, float pct);
	float bmx_ofx_ofsoundplayer_getposition(ofSoundPlayer * player);
	int bmx_ofx_ofsoundplayer_getisplaying(ofSoundPlayer * player);
	float bmx_ofx_ofsoundplayer_getspeed(ofSoundPlayer * player);
	float bmx_ofx_ofsoundplayer_getpan(ofSoundPlayer * player);

	void bmx_ofx_ofsoundplayer_ofSoundStopAll();
	void bmx_ofx_ofsoundplayer_ofSoundSetVolume(float vol);
	float * bmx_ofx_ofsoundplayer_ofSoundGetSpectrum(int bands);


}

