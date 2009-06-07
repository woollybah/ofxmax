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

void bmx_ofx_ofxcvimage_blur(ofxCvImage * img, int value) {
	img->blur(value);
}

void bmx_ofx_ofxcvimage_blurgaussian(ofxCvImage * img, int value) {
	img->blurGaussian(value);
}

void bmx_ofx_ofxcvimage_clear(ofxCvImage * img) {
	img->clear();
}

float bmx_ofx_ofxcvimage_getwidth(ofxCvImage * img) {
	return img->getWidth();
}

float bmx_ofx_ofxcvimage_getheight(ofxCvImage * img) {
	return img->getHeight();
}

void bmx_ofx_ofxcvimage_setusetexture(ofxCvImage * img, int use) {
	img->setUseTexture(static_cast<bool>(use));
}

unsigned char* bmx_ofx_ofxcvimage_getpixels(ofxCvImage * img) {
	return img->getPixels();
}

void bmx_ofx_ofxcvimage_setanchorpercent(ofxCvImage * img, float xPct, float yPct) {
	img->setAnchorPercent(xPct, yPct);
}

void bmx_ofx_ofxcvimage_setanchorpoint(ofxCvImage * img, int x, int y) {
	img->setAnchorPoint(x, y);
}

void bmx_ofx_ofxcvimage_resetanchor(ofxCvImage * img) {
	img->resetAnchor();
}

void bmx_ofx_ofxcvimage_erode(ofxCvImage * img) {
	img->erode();
}

void bmx_ofx_ofxcvimage_dilate(ofxCvImage * img) {
	img->dilate();
}

void bmx_ofx_ofxcvimage_invert(ofxCvImage * img) {
	img->invert();
}

void bmx_ofx_ofxcvimage_contrastStretch(ofxCvImage * img) {
	img->contrastStretch();
}

void bmx_ofx_ofxcvimage_convertToRange(ofxCvImage * img, float _min, float _max) {
	img->convertToRange(_min, _max);
}

void bmx_ofx_ofxcvimage_resize(ofxCvImage * img, int w, int h) {
	img->resize(w, h);
}

void bmx_ofx_ofxcvimage_scaleintome(ofxCvImage * img, ofxCvImage * mom, int interpolationMethod) {
	img->scaleIntoMe(*mom, interpolationMethod);
}

void bmx_ofx_ofxcvimage_mirror(ofxCvImage * img, int flipVertically, int flipHorizontally) {
	img->mirror(flipVertically, flipHorizontally);
}

void bmx_ofx_ofxcvimage_translate(ofxCvImage * img, float x, float y) {
	img->translate(x, y);
}

void bmx_ofx_ofxcvimage_rotate(ofxCvImage * img, float angle, float centerX, float centerY) {
	img->rotate(angle, centerX, centerY);
}

void bmx_ofx_ofxcvimage_scale(ofxCvImage * img, float scaleX, float scaleY) {
	img->scale(scaleX, scaleY);
}

void bmx_ofx_ofxcvimage_transform(ofxCvImage * img, float angle, float centerX, float centerY, float scaleX, float scaleY, float moveX, float moveY) {
	img->transform(angle, centerX, centerY, scaleX, scaleY, moveX, moveY);
}

void bmx_ofx_ofxcvimage_undistort(ofxCvImage * img, float radialDistX, float radialDistY, float tangentDistX, float tangentDistY, float focalX,
float focalY, float centerX, float centerY) {
	img->undistort(radialDistX, radialDistY, tangentDistX, tangentDistY, focalX, focalY, centerX, centerY);
}

int bmx_ofx_ofxcvimage_countnonzeroinregion(ofxCvImage * img, int x, int y, int w, int h) {
	return img->countNonZeroInRegion(x, y, w, h);
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvColorImage * bmx_ofx_ofxcvcolorimage_new() {
	return new ofxCvColorImage();
}

void bmx_ofx_ofxcvcolorimage_setfrompixels(ofxCvColorImage * img, unsigned char * pixels, int w, int h) {
	img->setFromPixels(pixels, w, h);
}

void bmx_ofx_ofxcvcolorimage_free(ofxCvColorImage * img) {
	delete img;
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

void bmx_ofx_ofxcvgrayscaleimage_free(ofxCvGrayscaleImage * img) {
	delete img;
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

void bmx_ofx_ofxcvcontourfinder_free(ofxCvContourFinder * finder) {
	delete finder;
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


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvHaarFinder * bmx_ofx_ofxcvhaarfinder_new() {
	return new ofxCvHaarFinder();
}

void bmx_ofx_ofxcvhaarfinder_setup(ofxCvHaarFinder * finder, BBString * haarFile) {
	char * f = bbStringToCString(haarFile);
	finder->setup(f);
	bbMemFree(f);
}

int bmx_ofx_ofxcvhaarfinder_ready(ofxCvHaarFinder * finder) {
	return static_cast<int>(finder->ready());
}

void bmx_ofx_ofxcvhaarfinder_setscalehaar(ofxCvHaarFinder * finder, float scaleHaar) {
	finder->setScaleHaar(scaleHaar);
}

void bmx_ofx_ofxcvhaarfinder_setneighbors(ofxCvHaarFinder * finder, unsigned neighbors) {
	finder->setNeighbors(neighbors);
}

int bmx_ofx_ofxcvhaarfinder_findhaarobjects(ofxCvHaarFinder * finder, ofxCvGrayscaleImage * img, int minWidth, int minHeight, int x,
		int y, int w, int h) {
	if (x == -1 || y == -1 || w == -1 || h == -1) {
		return finder->findHaarObjects(*img, minWidth, minHeight);
	} else {
		return finder->findHaarObjects(*img, x, y, w, h, minWidth, minHeight);
	}
}

void bmx_ofx_ofxcvhaarfinder_free(ofxCvHaarFinder * finder) {
	delete finder;
}

MaxofxCvBlobIterator * bmx_ofx_ofxcvhaarfinder_getblobs(ofxCvHaarFinder * finder) {
	return new MaxofxCvBlobIterator(&finder->blobs);
}

float bmx_ofx_ofxcvhaarfinder_getwidth(ofxCvHaarFinder * finder) {
	return finder->getWidth();
}

float bmx_ofx_ofxcvhaarfinder_getheight(ofxCvHaarFinder * finder) {
	return finder->getHeight();
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvOpticalFlowLK * bmx_ofx_ofxcvopticalflowlk_new() {
	return new ofxCvOpticalFlowLK();
}

void bmx_ofx_ofxcvopticalflowlk_allocate(ofxCvOpticalFlowLK * flow, int w, int h) {
	flow->allocate(w, h);
}

void bmx_ofx_ofxcvopticalflowlk_getvelocity(ofxCvOpticalFlowLK * flow, int x, int y, float * vx, float * vy) {
	flow->getVelocity(x, y, vx, vy);
}

void bmx_ofx_ofxcvopticalflowlk_calculateflow(ofxCvOpticalFlowLK * flow, ofxCvGrayscaleImage * prev, ofxCvGrayscaleImage * curr) {
	flow->calculateFlow(*prev, *curr);
}

