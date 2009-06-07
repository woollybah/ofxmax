
#ifndef OFX_CV_OPTICAL_FLOW
#define OFX_CV_OPTICAL_FLOW


#include "ofxCvConstants.h"
#include "ofxCvGrayscaleImage.h"


class ofxCvOpticalFlow {

  public:
  
    ofxCvOpticalFlow();
    virtual  ~ofxCvOpticalFlow();

	void allocate(int width, int height);

	void getVelocity(int x, int y, float * vx, float * vy);

protected:

	IplImage* velX;
	IplImage* velY;

	int _width;
	int _height;

};


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


class ofxCvOpticalFlowLK : public ofxCvOpticalFlow
{
public:
  
    ofxCvOpticalFlowLK();
    virtual  ~ofxCvOpticalFlowLK();

	void calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr);


protected:
	int winSize; // MUST be odd number !!!!!

};


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


class ofxCvOpticalFlowHS : public ofxCvOpticalFlow
{
public:
  
    ofxCvOpticalFlowHS();
    virtual  ~ofxCvOpticalFlowHS();

	void calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr);
	void setCriteria(CvTermCriteria crit);
	void setLambda(double l);

protected:
	bool usePrevious;
	double lambda;
	CvTermCriteria criteria;

};


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

class ofxCvOpticalFlowBM : public ofxCvOpticalFlow
{
public:
  
    ofxCvOpticalFlowBM();
    virtual  ~ofxCvOpticalFlowBM();

	void calculateFlow(ofxCvGrayscaleImage& prev, ofxCvGrayscaleImage& curr);

	void allocate(int width, int height);

	void setBlockSize(int width, int height);
	void setShiftSizeSize(int width, int height);
	void setMaxRange(int width, int height);

protected:
	CvSize blockSize;
	CvSize shiftSize;
	CvSize maxRange;
	bool usePrevious;

};



#endif


