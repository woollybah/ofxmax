#ifndef _OF_NOISE_H_
#define _OF_NOISE_H_


class ofNoise {

	public :
	
		ofNoise();
		virtual ~ofNoise();
		
		float noise(float x);
		float noise(float x, float y);
		float noise(float x, float y, float z);
		
		void noiseDetail(int lod);
		void noiseDetail(int lod, float falloff);
		void noiseSeed(

}