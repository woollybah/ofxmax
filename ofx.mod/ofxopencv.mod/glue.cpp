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

#include "glue.h"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MaxofxCvBlobIterator::MaxofxCvBlobIterator(vector<ofxCvBlob> * b)
{
	blobs = b;
	iter = blobs->begin();
}

MaxofxCvBlobIterator::~MaxofxCvBlobIterator()
{
}
	
int MaxofxCvBlobIterator::size() {
	return blobs->size();
}

int MaxofxCvBlobIterator::hasNext() {
	return static_cast<int>(iter != blobs->end());
}

ofxCvBlob * MaxofxCvBlobIterator::next() {
	if (iter != blobs->end()) {
		ofxCvBlob * blob = &(*iter);
		iter++;
		return blob;
	} else {
		return 0;
	}
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_ofx_ofxcvimage_copycolor(ofxCvImage * img, ofxCvColorImage * image) {
	*img = *image;
}

void bmx_ofx_ofxcvimage_copygray(ofxCvImage * img, ofxCvGrayscaleImage * image) {
	*img = *image;
}

void bmx_ofx_ofxcvimage_draw(ofxCvImage * img, float x, float y, float w, float h) {
	if (w==0 || h==0) {
		img->draw(x, y);
	} else {
		img->draw(x, y, w, h);
	}
}

void bmx_ofx_ofxcvimage_setfrompixels(ofxCvImage * img, unsigned char * pixels, int w, int h) {
	img->setFromPixels(pixels, w, h);
}

void bmx_ofx_ofxcvimage_allocate(ofxCvImage * img, int w, int h) {
	img->allocate(w, h);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvColorImage * bmx_ofx_ofxcvcolorimage_new() {
	return new ofxCvColorImage();
}

void bmx_ofx_ofxcvcolorimage_setfrompixels(ofxCvColorImage * img, unsigned char * pixels, int w, int h) {
	img->setFromPixels(pixels, w, h);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvGrayscaleImage * bmx_ofx_ofxcvgrayscaleimage_new() {
	return new ofxCvGrayscaleImage();
}

void bmx_ofx_ofxcvgrayscaleimage_absdiff(ofxCvGrayscaleImage * image, ofxCvGrayscaleImage * mom, ofxCvGrayscaleImage * dad) {
	if (dad) {
		image->absDiff(*mom, *dad);
	} else {
		image->absDiff(*mom);
	}
}

void bmx_ofx_ofxcvgrayscaleimage_threshold(ofxCvGrayscaleImage * image, int value, int invert) {
	image->threshold(value, static_cast<bool>(invert));
}

void bmx_ofx_ofxcvgrayscaleimage_adaptivethreshold(ofxCvGrayscaleImage * image, int blockSize, int offset, int invert, int gauss) {
	image->adaptiveThreshold(blockSize, offset, static_cast<bool>(invert), static_cast<bool>(gauss));
}

void bmx_ofx_ofxcvgrayscaleimage_setfrompixels(ofxCvGrayscaleImage * img, unsigned char * pixels, int w, int h) {
	img->setFromPixels(pixels, w, h);
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvContourFinder * bmx_ofx_ofxcvcontourfinder_new() {
	return new ofxCvContourFinder();
}

int bmx_ofx_ofxcvcontourfinder_findcontours(ofxCvContourFinder * finder, ofxCvGrayscaleImage * input, int minArea, int maxArea,
		int considered, int findHoles, int useApproximation) {
	return finder->findContours(*input, minArea, maxArea, considered, static_cast<bool>(findHoles), static_cast<bool>(useApproximation));
}

void bmx_ofx_ofxcvcontourfinder_draw(ofxCvContourFinder * finder, float x, float y, float w, float h) {
	if (w==0 || h==0) {
		finder->draw(x, y);
	} else {
		finder->draw(x, y, w, h);
	}
}

MaxofxCvBlobIterator * bmx_ofx_ofxcvcontourfinder_getblobs(ofxCvContourFinder * finder) {
	return new MaxofxCvBlobIterator(&finder->blobs);
}

float bmx_ofx_ofxcvcontourfinder_getheight(ofxCvContourFinder * finder) {
	return finder->getHeight();
}

float bmx_ofx_ofxcvcontourfinder_getwidth(ofxCvContourFinder * finder) {
	return finder->getWidth();
}

void bmx_ofx_ofxcvcontourfinder_setanchorpercent(ofxCvContourFinder * finder, float xPct, float yPct) {
	finder->setAnchorPercent(xPct, yPct);
}

void bmx_ofx_ofxcvcontourfinder_setanchorpoint(ofxCvContourFinder * finder, int x, int y) {
	finder->setAnchorPoint(x, y);
}

void bmx_ofx_ofxcvcontourfinder_resetanchor(ofxCvContourFinder * finder) {
	finder ->resetAnchor();
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

int bmx_ofx_ofxfvblobiterator_hasnext(MaxofxCvBlobIterator * iter) {
	return iter->hasNext();
}

ofxCvBlob * bmx_ofx_ofxfvblobiterator_next(MaxofxCvBlobIterator * iter) {
	return iter->next();
}

int bmx_ofx_ofxfvblobiterator_size(MaxofxCvBlobIterator * iter) {
	return iter->size();
}

void bmx_ofx_ofxfvblobiterator_free(MaxofxCvBlobIterator * iter) {
	delete iter;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_ofx_ofxcvblob_draw(ofxCvBlob * blob, float x, float y) {
	blob->draw(x, y);
}

float bmx_ofx_ofxcvblob_getarea(ofxCvBlob * blob) {
	return blob->area;
}

float bmx_ofx_ofxcvblob_getlength(ofxCvBlob * blob) {
	return blob->length;
}

void bmx_ofx_ofxcvblob_getboundingrect(ofxCvBlob * blob, float * x, float * y, float * w, float * h) {
	ofRectangle r = blob->boundingRect;
	*x = r.x;
	*y = r.y;
	*w = r.width;
	*h = r.height;
}

void bmx_ofx_ofxcvblob_getcentroid(ofxCvBlob * blob, float * x, float * y) {
	ofPoint c = blob->centroid;
	*x = c.x;
	*y = c.y;
}

int bmx_ofx_ofxcvblob_hole(ofxCvBlob * blob) {
	return static_cast<int>(blob->hole);
}



