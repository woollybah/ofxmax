
#include "glue.h"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MaxofxFiducialIterator::MaxofxFiducialIterator(vector<ofxFiducial> * f)
	: isList(false)
{
	fiducialsVec = f;
	iterVec = fiducialsVec->begin();
}

MaxofxFiducialIterator::MaxofxFiducialIterator(list<ofxFiducial> * f)
	: isList(true)
{
	fiducialsList = f;
	iterList = fiducialsList->begin();
}


MaxofxFiducialIterator::~MaxofxFiducialIterator()
{
}
	
int MaxofxFiducialIterator::size() {
	if (isList) {
		return fiducialsList->size();
	} else {
		return fiducialsVec->size();
	}
}

int MaxofxFiducialIterator::hasNext() {
	if (isList) {
		return static_cast<int>(iterList != fiducialsList->end());
	} else {
		return static_cast<int>(iterVec != fiducialsVec->end());
	}
}

ofxFiducial * MaxofxFiducialIterator::next() {
	if (isList) {
		if (iterList != fiducialsList->end()) {
			ofxFiducial * fid = &(*iterList);
			iterList++;
			return fid;
		} else {
			return 0;
		}
	} else {
		if (iterVec != fiducialsVec->end()) {
			ofxFiducial * fid = &(*iterVec);
			iterVec++;
			return fid;
		} else {
			return 0;
		}
	}
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxFiducialFinder * bmx_ofx_ofxfiducialfinder_new() {

}

void bmx_ofx_ofxfiducialfinder_findfiducials(ofxFiducialFinder * finder, ofxCvGrayscaleImage * inp) {
	finder->findFiducials(*inp);
}

void bmx_ofx_ofxfiducialfinder_inittree(ofxFiducialFinder * finder, BBString * filename) {
	char * f = bbStringToCString(filename);
	finder->initTree(f);
	bbMemFree(f);
}

void bmx_ofx_ofxfiducialfinder_initdefaulttree(ofxFiducialFinder * finder) {
	finder->initDefaultTree();
}

void bmx_ofx_ofxfiducialfinder_free(ofxFiducialFinder * finder) {
	delete finder;
}

MaxofxFiducialIterator * bmx_ofx_ofxfiducialfinder_getfiducials(ofxFiducialFinder * finder) {
	return new MaxofxFiducialIterator(&finder->_fiducials);
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

int bmx_ofx_ofxfiducialiterator_size(MaxofxFiducialIterator * iter) {
	return iter->size();
}

int bmx_ofx_ofxfiducialiterator_hasnext(MaxofxFiducialIterator * iter) {
	return iter->hasNext();
}

ofxFiducial * bmx_ofx_ofxfiducialiterator_next(MaxofxFiducialIterator * iter) {
	return iter->next();
}

void bmx_ofx_ofxfiducialiterator_free(MaxofxFiducialIterator * iter) {
	delete iter;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxFiducialTracker * bmx_ofx_ofxfiducialtracker_new() {
	return new ofxFiducialTracker();
}

void bmx_ofx_ofxfiducialtracker_findfiducials(ofxFiducialTracker * finder, ofxCvGrayscaleImage * inp) {
	finder->findFiducials(*inp);
}

void bmx_ofx_ofxfiducialtracker_inittree(ofxFiducialTracker * finder, BBString * filename) {
	char * f = bbStringToCString(filename);
	finder->initTree(f);
	bbMemFree(f);
}

void bmx_ofx_ofxfiducialtracker_initdefaulttree(ofxFiducialTracker * finder) {
	finder->initDefaultTree();
}

void bmx_ofx_ofxfiducialtracker_free(ofxFiducialTracker * finder) {
	delete finder;
}

MaxofxFiducialIterator * bmx_ofx_ofxfiducialtracker_getfiducials(ofxFiducialTracker * finder) {
	return new MaxofxFiducialIterator(&finder->fiducialsList);
}


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_ofx_ofxfiducial_draw(ofxFiducial * fid, float x, float y) {
	fid->draw(x, y);
}

void bmx_ofx_ofxfiducial_drawcorners(ofxFiducial * fid, float x, float y) {
	fid->drawCorners(x, y);
}

int bmx_ofx_ofxfiducial_isalive(ofxFiducial * fid) {
	return static_cast<int>(fid->isAlive());
}

int bmx_ofx_ofxfiducial_ispointinside(ofxFiducial * fid, float x, float y) {
	return static_cast<int>(fid->isPointInside(x, y));
}

int bmx_ofx_ofxfiducial_getid(ofxFiducial * fid) {
	return fid->getId();
}

float bmx_ofx_ofxfiducial_getmspeed(ofxFiducial * fid) {
	return fid->getMSpeed();
}

float bmx_ofx_ofxfiducial_getmaccel(ofxFiducial * fid) {
	return fid->getMAccel();
}

float bmx_ofx_ofxfiducial_getmspeedx(ofxFiducial * fid) {
	return fid->getMSpeedX();
}

float bmx_ofx_ofxfiducial_getmspeedy(ofxFiducial * fid) {
	return fid->getMSpeedY();
}

float bmx_ofx_ofxfiducial_getx(ofxFiducial * fid) {
	return fid->getX();
}

float bmx_ofx_ofxfiducial_gety(ofxFiducial * fid) {
	return fid->getY();
}

float bmx_ofx_ofxfiducial_getangle(ofxFiducial * fid) {
	return fid->getAngleDeg();
}

float bmx_ofx_ofxfiducial_getrspeed(ofxFiducial * fid) {
	return fid->getRSpeed();
}

float bmx_ofx_ofxfiducial_getraccel(ofxFiducial * fid) {
	return fid->getRAccel();
}

float bmx_ofx_ofxfiducial_getrootsize(ofxFiducial * fid) {
	return fid->getRootSize();
}

int bmx_ofx_ofxfiducial_getcornerupdatestatus(ofxFiducial * fid) {
	return static_cast<int>(fid->getCornerUpdateStatus());
}

void bmx_ofx_ofxfiducial_setupdatecorners(ofxFiducial * fid, int _update) {
	fid->setUpdateCorners(static_cast<bool>(_update));
}

void bmx_ofx_ofxfiducial_update(ofxFiducial * fid, float x, float y, float angle, float root, float leaf) {
	fid->update(x, y, angle * 0.0174532925f, root, leaf);
}

void bmx_ofx_ofxfiducial_computecorners(ofxFiducial * fid) {
	fid->computeCorners();
}

float bmx_ofx_ofxfiducial_getdistance(ofxFiducial * fid, float x, float y) {
	return fid->getDistance(x, y);
}


