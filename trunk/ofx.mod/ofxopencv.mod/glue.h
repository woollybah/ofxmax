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

class MaxofxCvBlobIterator;

extern "C" {


	void bmx_ofx_ofxcvimage_copycolor(ofxCvImage * img, ofxCvColorImage * image);
	void bmx_ofx_ofxcvimage_copygray(ofxCvImage * img, ofxCvGrayscaleImage * image);
	void bmx_ofx_ofxcvimage_draw(ofxCvImage * img, float x, float y, float w, float h);
	void bmx_ofx_ofxcvimage_setfrompixels(ofxCvImage * img, unsigned char * pixels, int w, int h);
	void bmx_ofx_ofxcvimage_allocate(ofxCvImage * img, int w, int h);

	ofxCvColorImage * bmx_ofx_ofxcvcolorimage_new();
	void bmx_ofx_ofxcvcolorimage_setfrompixels(ofxCvColorImage * img, unsigned char * pixels, int w, int h);
	
	ofxCvGrayscaleImage * bmx_ofx_ofxcvgrayscaleimage_new();
	void bmx_ofx_ofxcvgrayscaleimage_absdiff(ofxCvGrayscaleImage * image, ofxCvGrayscaleImage * mom, ofxCvGrayscaleImage * dad);
	void bmx_ofx_ofxcvgrayscaleimage_threshold(ofxCvGrayscaleImage * image, int value, int invert);
	void bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(ofxCvGrayscaleImage * image, int blockSize, int offset, int invert, int gauss);
	void bmx_ofx_ofxcvgrayscaleimage_setfrompixels(ofxCvGrayscaleImage * img, unsigned char * pixels, int w, int h);


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
