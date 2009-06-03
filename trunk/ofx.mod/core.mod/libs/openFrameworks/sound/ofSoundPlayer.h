#ifndef _OF_SAMPLE_SOUND
#define _OF_SAMPLE_SOUND

#include "ofConstants.h"

#ifndef TARGET_OF_IPHONE
//extern "C" {
//#include "fmod.h"
//#include "fmod_errors.h"
//}
#endif

//		TO DO :
//		---------------------------
// 		-fft via fmod, as in the last time...
// 		-close fmod if it's up
//		-loadSoundForStreaming(char * fileName);
//		---------------------------

// 		interesting:
//		http://www.compuphase.com/mp3/mp3loops.htm


// ---------------------------------------------------------------------------- SOUND SYSTEM FMOD

// --------------------- global functions:
void ofSoundStopAll();
void ofSoundSetVolume(float vol);
float * ofSoundGetSpectrum(int nBands); // max 512...


// --------------------- player functions:
class ofSoundPlayer {

	public:

		ofSoundPlayer() {};
		virtual ~ofSoundPlayer() {} ;

		virtual void loadSound(string fileName, bool stream = false) {};
		virtual void unloadSound() {};
		virtual void play() {};
		virtual void stop() {};

		virtual void setVolume(float vol) {};
		virtual void setPan(float vol) {};
		virtual void setSpeed(float spd) {};
		virtual void setPaused(bool bP) {};
		virtual void setLoop(bool bLp) {};
		virtual void setMultiPlay(bool bMp) {};
		virtual void setPosition(float pct) {}; // 0 = start, 1 = end;

		virtual float getPosition() { return .0f;};
		virtual bool getIsPlaying() {return false;};
		virtual float getSpeed() {return .0f;};
		virtual float getPan() {return .0f;};

		//static void initializeFmod();
		//static void closeFmod();

		bool isStreaming;
		bool bMultiPlay;
		bool bLoop;
		bool bLoadedOk;
		bool bPaused;
		float pan; // 0 - 1
		float volume; // 0 - 1
		float internalFreq; // 44100 ?
		float speed; // -n to n, 1 = normal, -1 backwards
		unsigned int length; // in samples;

		#ifndef TARGET_OF_IPHONE
//			FMOD_RESULT result;
//			FMOD_CHANNEL * channel;
//			FMOD_SOUND * sound;
		#endif
};

#endif // _OF_SAMPLE_SOUND
