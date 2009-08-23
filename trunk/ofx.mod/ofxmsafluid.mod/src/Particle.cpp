/*
 *  Particle.cpp
 *  ofxMSAFluid Demo
 *
 *  Created by Mehmet Akten on 02/05/2009.
 *  Copyright 2009 MSA Visuals Ltd.. All rights reserved.
 *
 */

#include "ofMain.h"
#include "ParticleSystem.h"


#define MOMENTUM		0.5
#define FLUID_FORCE		0.6




void Particle::init(ofxParticleSystem * system, float x, float y) {
	this->system = system;
	this->x = x;
	this->y = y;
	vx = 0;
	vy = 0;
	radius = 5;
	alpha  = ofRandom(0.3, 1);
	mass = ofRandom(0.1, 1);
}


void Particle::update() {
	// only update if particle is visible
	if(alpha == 0) return;
	
	// read fluid info and add to velocity
	int fluidIndex = system->fluidSolver->getIndexForNormalizedPosition(x * system->invWidth, y * system->invHeight);
	vx = system->fluidSolver->u[fluidIndex] * system->width * mass * FLUID_FORCE + vx * MOMENTUM;
	vy = system->fluidSolver->v[fluidIndex] * system->height * mass * FLUID_FORCE + vy * MOMENTUM;
	
//	color.r = myApp->fluidSolver.r[fluidIndex] + 0.5;
//	color.g = myApp->fluidSolver.g[fluidIndex] + 0.5;
//	color.b = myApp->fluidSolver.b[fluidIndex] + 0.5;
	
	
	// update position
	x += vx;
	y += vy;
	
	// bounce of edges
	if(x<0) {
		x = 0;
		vx *= -1;
	}
	else if(x > system->width) {
		x = system->width;
		vx *= -1;
	}
	
	if(y<0) {
		y = 0;
		vy *= -1;
	}
	else if(y > system->height) {
		y = system->height;
		vy *= -1;
	}
	
	// hackish way to make particles glitter when the slow down a lot
	if(vx * vx + vy * vy < 1) {
		vx = ofRandom(-0.5, 0.5);
		vy = ofRandom(-0.5, 0.5);
	}
	
	// fade out a bit (and kill if alpha == 0);
	alpha *= 0.999;
	if(alpha < 0.01) alpha = 0;
}


void Particle::updateVertexArrays(int i, float* posBuffer, float* colBuffer) {
	int vi = i * 4;
	posBuffer[vi++] = x - vx;
	posBuffer[vi++] = y - vy;
	posBuffer[vi++] = x;
	posBuffer[vi++] = y;
	
	int ci = i * 6;
	if(system->drawFluid) {
		// if drawing fluid, draw lines as black & white
		colBuffer[ci++] = alpha;
		colBuffer[ci++] = alpha;
		colBuffer[ci++] = alpha;
		colBuffer[ci++] = alpha;
		colBuffer[ci++] = alpha;
		colBuffer[ci++] = alpha;
	} else {
		// otherwise, use color
		float vxNorm = vx * system->invWidth;
		float vyNorm = vy * system->invHeight;
		float v2 = vxNorm * vxNorm + vyNorm * vyNorm;
#define VMAX 0.013f
		if(v2>VMAX*VMAX) v2 = VMAX*VMAX;
		msaColor color;
		float satInc = mass > 0.5 ? mass * mass * mass : 0;
		satInc *= satInc * satInc * satInc;
		color.setHSV(0, ofMap(v2, 0, VMAX*VMAX, 0, 1) + satInc, ofLerp(0.5, 1, mass) * alpha);

		colBuffer[ci++] = color.r;
		colBuffer[ci++] = color.g;
		colBuffer[ci++] = color.b;
		colBuffer[ci++] = color.r;
		colBuffer[ci++] = color.g;
		colBuffer[ci++] = color.b;
	}
}


void Particle::drawOldSchool() {
	glColor3f(alpha, alpha, alpha);
	glVertex2f(x-vx, y-vy);
	glVertex2f(x, y);
}