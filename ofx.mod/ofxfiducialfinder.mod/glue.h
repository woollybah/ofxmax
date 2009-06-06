#include "ofxFidMain.h"

class MaxofxFiducialIterator;

extern "C" {

#include "blitz.h"

	ofxFiducialFinder * bmx_ofx_ofxfiducialfinder_new();
	void bmx_ofx_ofxfiducialfinder_findfiducials(ofxFiducialFinder * finder, ofxCvGrayscaleImage * inp);
	void bmx_ofx_ofxfiducialfinder_inittree(ofxFiducialFinder * finder, BBString * filename);
	void bmx_ofx_ofxfiducialfinder_initdefaulttree(ofxFiducialFinder * finder);
	void bmx_ofx_ofxfiducialfinder_free(ofxFiducialFinder * finder);
	MaxofxFiducialIterator * bmx_ofx_ofxfiducialfinder_getfiducials(ofxFiducialFinder * finder);

	int bmx_ofx_ofxfiducialiterator_size(MaxofxFiducialIterator * iter);
	int bmx_ofx_ofxfiducialiterator_hasnext(MaxofxFiducialIterator * iter);
	ofxFiducial * bmx_ofx_ofxfiducialiterator_next(MaxofxFiducialIterator * iter);
	void bmx_ofx_ofxfiducialiterator_free(MaxofxFiducialIterator * iter);

	ofxFiducialTracker * bmx_ofx_ofxfiducialtracker_new();
	void bmx_ofx_ofxfiducialtracker_findfiducials(ofxFiducialTracker * finder, ofxCvGrayscaleImage * inp);
	void bmx_ofx_ofxfiducialtracker_inittree(ofxFiducialTracker * finder, BBString * filename);
	void bmx_ofx_ofxfiducialtracker_initdefaulttree(ofxFiducialTracker * finder);
	void bmx_ofx_ofxfiducialtracker_free(ofxFiducialTracker * finder);
	MaxofxFiducialIterator * bmx_ofx_ofxfiducialtracker_getfiducials(ofxFiducialTracker * finder);

	void bmx_ofx_ofxfiducial_draw(ofxFiducial * fid, float x, float y);
	void bmx_ofx_ofxfiducial_drawcorners(ofxFiducial * fid, float x, float y);
	int bmx_ofx_ofxfiducial_isalive(ofxFiducial * fid);
	int bmx_ofx_ofxfiducial_ispointinside(ofxFiducial * fid, float x, float y);
	int bmx_ofx_ofxfiducial_getid(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getmspeed(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getmaccel(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getmspeedx(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getmspeedy(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getx(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_gety(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getangle(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getrspeed(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getraccel(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getrootsize(ofxFiducial * fid);
	int bmx_ofx_ofxfiducial_getcornerupdatestatus(ofxFiducial * fid);
	void bmx_ofx_ofxfiducial_setupdatecorners(ofxFiducial * fid, int _update);
	void bmx_ofx_ofxfiducial_update(ofxFiducial * fid, float x, float y, float angle, float root, float leaf);
	void bmx_ofx_ofxfiducial_computecorners(ofxFiducial * fid);
	float bmx_ofx_ofxfiducial_getdistance(ofxFiducial * fid, float x, float y);

}


class MaxofxFiducialIterator
{
public:

	MaxofxFiducialIterator(vector<ofxFiducial> * f);
	MaxofxFiducialIterator(std::list<ofxFiducial> * f);
	~MaxofxFiducialIterator();
	
	int size();
	int hasNext();
	ofxFiducial * next();

private:
	std::list<ofxFiducial> * fiducialsList;
	std::list<ofxFiducial>::iterator iterList;

	vector<ofxFiducial> * fiducialsVec;
	vector<ofxFiducial>::iterator iterVec;
	
	bool isList;
};


