/*
 *  ParticleSystem.h
 *  ofxMSAFluid Demo
 *
 *  Created by Mehmet Akten on 02/05/2009.
 *  Copyright 2009 MSA Visuals Ltd.. All rights reserved.
 *
 */
#pragma once

#ifndef __PARTICLE_SYSTEM__
#define __PARTICLE_SYSTEM__

#include "ofxMSAFluidSolver.h"
#include "ofxMSAUtils.h"

#define MAX_PARTICLES		50000

class ofxParticleSystem;

class Particle {
public:	

	ofxParticleSystem * system;
    float x, y;
    float vx, vy;
    float radius;
    float alpha;
    float mass;
	
    void init(ofxParticleSystem * system, float x, float y);
    void update();
	void updateVertexArrays(int i, float* posBuffer, float* colBuffer);
	void drawOldSchool();
};


class ofxParticleSystem {
public:	
	
    float posArray[MAX_PARTICLES * 2 * 2];
    float colArray[MAX_PARTICLES * 3 * 2];
	
    int curIndex;
	
    Particle particles[MAX_PARTICLES];

	ofxMSAFluidSolver * fluidSolver;
	int width;
	int height;
	bool drawFluid;
	float invWidth;
	float invHeight;
	
    ofxParticleSystem();
	
	void init(ofxMSAFluidSolver * fluidSolver, int width, int height);
    void updateAndDraw(bool renderUsingVA = false);
	void addParticles(float x, float y, int count );
	void addParticle(float x, float y);
};

#endif



