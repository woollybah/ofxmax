/*
 Copyright (c) 2009 Bruce A Henderson
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
     * Redistributions of source code must retain the above copyright
       notice, this list of conditions and the following disclaimer.
     * Redistributions in binary form must reproduce the above copyright
       notice, this list of conditions and the following disclaimer in the
       documentation and/or other materials provided with the distribution.
     * Neither the name of Bruce A Henderson nor the
       names of its contributors may be used to endorse or promote products
       derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY Bruce A Henderson ``AS IS'' AND ANY
 EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL Bruce A Henderson BE LIABLE FOR ANY
 DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include "ofxOpenCv.h"
#include "ofxCvHaarFinder.h"
#include "ofxCvOpticalFlow.h"

class MaxofxCvBlobIterator;

extern "C" {

#include "blitz.h"

	void bmx_ofx_ofxcvimage_copycolor(ofxCvImage * img, ofxCvColorImage * image);
	void bmx_ofx_ofxcvimage_copygray(ofxCvImage * img, ofxCvGrayscaleImage * image);
	void bmx_ofx_ofxcvimage_draw(ofxCvImage * img, float x, float y, float w, float h);
	void bmx_ofx_ofxcvimage_setfrompixels(ofxCvImage * img, unsigned char * pixels, int w, int h);
	void bmx_ofx_ofxcvimage_allocate(ofxCvImage * img, int w, int h);
	void bmx_ofx_ofxcvimage_blur(ofxCvImage * img, int value);
	void bmx_ofx_ofxcvimage_blurgaussian(ofxCvImage * img, int value);
	void bmx_ofx_ofxcvimage_clear(ofxCvImage * img);
	float bmx_ofx_ofxcvimage_getwidth(ofxCvImage * img);
	float bmx_ofx_ofxcvimage_getheight(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_setusetexture(ofxCvImage * img, int use);
	unsigned char* bmx_ofx_ofxcvimage_getpixels(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_setanchorpercent(ofxCvImage * img, float xPct, float yPct);
	void bmx_ofx_ofxcvimage_setanchorpoint(ofxCvImage * img, int x, int y);
	void bmx_ofx_ofxcvimage_resetanchor(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_erode(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_dilate(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_invert(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_contrastStretch(ofxCvImage * img);
	void bmx_ofx_ofxcvimage_convertToRange(ofxCvImage * img, float _min, float _max);
	void bmx_ofx_ofxcvimage_resize(ofxCvImage * img, int w, int h);
	void bmx_ofx_ofxcvimage_scaleintome(ofxCvImage * img, ofxCvImage * mom, int interpolationMethod);
	void bmx_ofx_ofxcvimage_mirror(ofxCvImage * img, int flipVertically, int flipHorizontally);
	void bmx_ofx_ofxcvimage_translate(ofxCvImage * img, float x, float y);
	void bmx_ofx_ofxcvimage_rotate(ofxCvImage * img, float angle, float centerX, float centerY);
	void bmx_ofx_ofxcvimage_scale(ofxCvImage * img, float scaleX, float scaleY);
	void bmx_ofx_ofxcvimage_transform(ofxCvImage * img, float angle, float centerX, float centerY, float scaleX, float scaleY, float moveX, float moveY);
	void bmx_ofx_ofxcvimage_undistort(ofxCvImage * img, float radialDistX, float radialDistY, float tangentDistX, float tangentDistY, float focalX,
		float focalY, float centerX, float centerY);
	int bmx_ofx_ofxcvimage_countnonzeroinregion(ofxCvImage * img, int x, int y, int w, int h);

	
	ofxCvColorImage * bmx_ofx_ofxcvcolorimage_new();
	void bmx_ofx_ofxcvcolorimage_setfrompixels(ofxCvColorImage * img, unsigned char * pixels, int w, int h);
	void bmx_ofx_ofxcvcolorimage_free(ofxCvColorImage * img);
	
	ofxCvGrayscaleImage * bmx_ofx_ofxcvgrayscaleimage_new();
	void bmx_ofx_ofxcvgrayscaleimage_absdiff(ofxCvGrayscaleImage * image, ofxCvGrayscaleImage * mom, ofxCvGrayscaleImage * dad);
	void bmx_ofx_ofxcvgrayscaleimage_threshold(ofxCvGrayscaleImage * image, int value, int invert);
	void bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(ofxCvGrayscaleImage * image, int blockSize, int offset, int invert, int gauss);
	void bmx_ofx_ofxcvgrayscaleimage_setfrompixels(ofxCvGrayscaleImage * img, unsigned char * pixels, int w, int h);
	void bmx_ofx_ofxcvgrayscaleimage_free(ofxCvGrayscaleImage * img);


	ofxCvContourFinder * bmx_ofx_ofxcvcontourfinder_new();
	int bmx_ofx_ofxcvcontourfinder_findcontours(ofxCvContourFinder * finder, ofxCvGrayscaleImage * input, int minArea, int maxArea,
		int considered, int findHoles, int useApproximation);
	void bmx_ofx_ofxcvcontourfinder_draw(ofxCvContourFinder * finder, float x, float y, float w, float h);
	MaxofxCvBlobIterator * bmx_ofx_ofxcvcontourfinder_getblobs(ofxCvContourFinder * finder);
	float bmx_ofx_ofxcvcontourfinder_getheight(ofxCvContourFinder * finder);
	float bmx_ofx_ofxcvcontourfinder_getwidth(ofxCvContourFinder * finder);
	void bmx_ofx_ofxcvcontourfinder_setanchorpercent(ofxCvContourFinder * finder, float xPct, float yPct);
	void bmx_ofx_ofxcvcontourfinder_setanchorpoint(ofxCvContourFinder * finder, int x, int y);
	void bmx_ofx_ofxcvcontourfinder_resetanchor(ofxCvContourFinder * finder);
	void bmx_ofx_ofxcvcontourfinder_free(ofxCvContourFinder * finder);

	int bmx_ofx_ofxfvblobiterator_hasnext(MaxofxCvBlobIterator * iter);
	ofxCvBlob * bmx_ofx_ofxfvblobiterator_next(MaxofxCvBlobIterator * iter);
	int bmx_ofx_ofxfvblobiterator_size(MaxofxCvBlobIterator * iter);
	void bmx_ofx_ofxfvblobiterator_free(MaxofxCvBlobIterator * iter);

	void bmx_ofx_ofxcvblob_draw(ofxCvBlob * blob, float x, float y);
	float bmx_ofx_ofxcvblob_getarea(ofxCvBlob * blob);
	float bmx_ofx_ofxcvblob_getlength(ofxCvBlob * blob);
	void bmx_ofx_ofxcvblob_getboundingrect(ofxCvBlob * blob, float * x, float * y, float * w, float * h);
	void bmx_ofx_ofxcvblob_getcentroid(ofxCvBlob * blob, float * x, float * y);
	int bmx_ofx_ofxcvblob_hole(ofxCvBlob * blob);

	ofxCvHaarFinder * bmx_ofx_ofxcvhaarfinder_new();
	void bmx_ofx_ofxcvhaarfinder_setup(ofxCvHaarFinder * finder, BBString * haarFile);
	int bmx_ofx_ofxcvhaarfinder_ready(ofxCvHaarFinder * finder);
	void bmx_ofx_ofxcvhaarfinder_setscalehaar(ofxCvHaarFinder * finder, float scaleHaar);
	void bmx_ofx_ofxcvhaarfinder_setneighbors(ofxCvHaarFinder * finder, unsigned neighbors);
	int bmx_ofx_ofxcvhaarfinder_findhaarobjects(ofxCvHaarFinder * finder, ofxCvGrayscaleImage * img, int minWidth, int minHeight, int x,
		int y, int w, int h);
	void bmx_ofx_ofxcvhaarfinder_free(ofxCvHaarFinder * finder);
	MaxofxCvBlobIterator * bmx_ofx_ofxcvhaarfinder_getblobs(ofxCvHaarFinder * finder);
	float bmx_ofx_ofxcvhaarfinder_getwidth(ofxCvHaarFinder * finder);
	float bmx_ofx_ofxcvhaarfinder_getheight(ofxCvHaarFinder * finder);

	ofxCvOpticalFlowLK * bmx_ofx_ofxcvopticalflowlk_new();
	void bmx_ofx_ofxcvopticalflowlk_allocate(ofxCvOpticalFlowLK * flow, int w, int h);
	void bmx_ofx_ofxcvopticalflowlk_getvelocity(ofxCvOpticalFlowLK * flow, int x, int y, float * vx, float * vy);
	void bmx_ofx_ofxcvopticalflowlk_calculateflow(ofxCvOpticalFlowLK * flow, ofxCvGrayscaleImage * prev, ofxCvGrayscaleImage * curr);

}

class MaxofxCvBlobIterator
{
public:

	MaxofxCvBlobIterator(vector<ofxCvBlob> * b);
	~MaxofxCvBlobIterator();
	
	int size();
	int hasNext();
	ofxCvBlob * next();

private:
	vector<ofxCvBlob> * blobs;
	vector<ofxCvBlob>::iterator iter;
};