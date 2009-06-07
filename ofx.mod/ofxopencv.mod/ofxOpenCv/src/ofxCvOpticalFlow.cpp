
#include "ofxCvOpticalFlow.h"


ofxCvOpticalFlow::ofxCvOpticalFlow()
	: _width(0), _height(0), velX(0), velY(0)
{
}

ofxCvOpticalFlow::~ofxCvOpticalFlow()
{
	if (velX) {
		cvReleaseImage(&velX);
		cvReleaseImage(&velY);
	}
}

void ofxCvOpticalFlow::allocate(int width, int height) {
	_width = width;
	_height = height;
	
	velX = cvCreateImage(cvSize(_width, _height), IPL_DEPTH_32F, 1);
	cvSetZero(velX);
	
	velY = cvCreateImage(cvSize(_width, _height), IPL_DEPTH_32F, 1);
	cvSetZero(velY);
}

void ofxCvOpticalFlow::getVelocity(int x, int y, float * vx, float * vy) {
	if (velX) {
		*vx = cvGetReal2D(velX, y, x);
		*vy = cvGetReal2D(velY, y, x);
	}
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvOpticalFlowLK::ofxCvOpticalFlowLK()
	: winSize(11)
{
}

ofxCvOpticalFlowLK::~ofxCvOpticalFlowLK()
{
}

void ofxCvOpticalFlowLK::calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr) {
	cvCalcOpticalFlowLK(prev.getCvImage(), curr.getCvImage(), cvSize(winSize, winSize), velX, velY);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


ofxCvOpticalFlowHS::ofxCvOpticalFlowHS()
{
}

ofxCvOpticalFlowHS::~ofxCvOpticalFlowHS()
{
}

void ofxCvOpticalFlowHS::calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr) {
	cvCalcOpticalFlowHS(prev.getCvImage(), curr.getCvImage(), usePrevious, velX, velY, lambda, criteria);
}

void ofxCvOpticalFlowHS::setCriteria(CvTermCriteria crit) {
	criteria = crit;
}

void ofxCvOpticalFlowHS::setLambda(double l) {
	lambda = l;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxCvOpticalFlowBM::ofxCvOpticalFlowBM()
	: blockSize(cvSize(8, 8)), shiftSize(cvSize(8, 8)), maxRange(cvSize(8, 8))
{
}

ofxCvOpticalFlowBM::~ofxCvOpticalFlowBM()
{
}

void ofxCvOpticalFlowBM::calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr) {
	cvCalcOpticalFlowBM(prev.getCvImage(), curr.getCvImage(), blockSize, shiftSize, maxRange,
		usePrevious, velX, velY);
}

void ofxCvOpticalFlowBM::allocate(int width, int height) {

	// free any existing settings before allocation
	if (velX) {
		cvReleaseImage(&velX);
		cvReleaseImage(&velY);
	}
	
	velX = cvCreateImage(cvSize((_width - blockSize.width)/shiftSize.width,
		(_height - blockSize.height)/shiftSize.height), IPL_DEPTH_32F, 1);
	cvSetZero(velX);

	velY = cvCreateImage(cvSize((_width - blockSize.width)/shiftSize.width,
		(_height - blockSize.height)/shiftSize.height), IPL_DEPTH_32F, 1);
	cvSetZero(velY);
		
}

void ofxCvOpticalFlowBM::setBlockSize(int width, int height) {
	bool change = (blockSize.width != width || blockSize.height != height);

	blockSize = cvSize(width, height);

	if (change && velX) {
		allocate(_width, _height);
	}
}

void ofxCvOpticalFlowBM::setShiftSizeSize(int width, int height) {
	bool change = (shiftSize.width != width || shiftSize.height != height);

	shiftSize = cvSize(width, height);

	if (change && velX) {
		allocate(_width, _height);
	}
}

void ofxCvOpticalFlowBM::setMaxRange(int width, int height) {
	maxRange = cvSize(width, height);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


