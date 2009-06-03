
#include "glue.h"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofSoundPlayer * bmx_ofx_ofsoundplayer_new() {
	return new ofFMODSoundPlayer();
}

void bmx_ofx_ofsoundplayer_loadsound(ofSoundPlayer * player, BBString * filename, int stream) {
	char * c = bbStringToCString(filename);
	player->loadSound(c, static_cast<bool>(stream));
	bbMemFree(c);
}

void bmx_ofx_ofsoundplayer_play(ofSoundPlayer * player) {
	player->play();
}

void bmx_ofx_ofsoundplayer_setvolume(ofSoundPlayer * player, float vol) {
	player->setVolume(vol);
}

void bmx_ofx_ofsoundplayer_unloadsound(ofSoundPlayer * player) {
	player->unloadSound();
}

void bmx_ofx_ofsoundplayer_stop(ofSoundPlayer * player) {
	player->stop();
}

void bmx_ofx_ofsoundplayer_setpan(ofSoundPlayer * player, float pan) {
	player->setPan(pan);
}

void bmx_ofx_ofsoundplayer_setspeed(ofSoundPlayer * player, float speed) {
	player->setSpeed(speed);
}

void bmx_ofx_ofsoundplayer_setpaused(ofSoundPlayer * player, int paused) {
	player->setPaused(static_cast<bool>(paused));
}

void bmx_ofx_ofsoundplayer_setloop(ofSoundPlayer * player, int loop) {
	player->setLoop(static_cast<bool>(loop));
}

void bmx_ofx_ofsoundplayer_setmultiplay(ofSoundPlayer * player, int mp) {
	player->setMultiPlay(static_cast<bool>(mp));
}

void bmx_ofx_ofsoundplayer_setposition(ofSoundPlayer * player, float pct) {
	player->setPosition(pct);
}

float bmx_ofx_ofsoundplayer_getposition(ofSoundPlayer * player) {
	return player->getPosition();
}

int bmx_ofx_ofsoundplayer_getisplaying(ofSoundPlayer * player) {
	return static_cast<int>(player->getIsPlaying());
}

float bmx_ofx_ofsoundplayer_getspeed(ofSoundPlayer * player) {
	return player->getSpeed();
}

float bmx_ofx_ofsoundplayer_getpan(ofSoundPlayer * player) {
	return player->getPan();
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_ofx_ofsoundplayer_ofSoundStopAll() {
	ofSoundStopAll();
}

void bmx_ofx_ofsoundplayer_ofSoundSetVolume(float vol) {
	ofSoundSetVolume(vol);
}

float * bmx_ofx_ofsoundplayer_ofSoundGetSpectrum(int bands) {
	return ofSoundGetSpectrum(bands);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
