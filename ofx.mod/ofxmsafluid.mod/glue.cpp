
#include "glue.h"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxMSAFluidSolver * bmx_ofx_ofxmsafluidsolver_new() {
	return new ofxMSAFluidSolver();
}

void bmx_ofx_ofxmsafluidsolver_setup(ofxMSAFluidSolver * solver, int nx, int ny) {
	solver->setup(nx, ny);
}

void bmx_ofx_ofxmsafluidsolver_setsize(ofxMSAFluidSolver * solver, int nx, int ny) {
	solver->setSize(nx, ny);
}

void bmx_ofx_ofxmsafluidsolver_setvisc(ofxMSAFluidSolver * solver, float newVisc) {
	solver->setVisc(newVisc);
}

void bmx_ofx_ofxmsafluidsolver_enablergb(ofxMSAFluidSolver * solver, int isRGB) {
	solver->enableRGB(static_cast<bool>(isRGB));
}

void bmx_ofx_ofxmsafluidsolver_setdeltat(ofxMSAFluidSolver * solver, float dt) {
	solver->setDeltaT(dt);
}

void bmx_ofx_ofxmsafluidsolver_setfadespeed(ofxMSAFluidSolver * solver, float fadeSpeed) {
	solver->setFadeSpeed(fadeSpeed);
}

void bmx_ofx_ofxmsafluidsolver_setsolveriterations(ofxMSAFluidSolver * solver, int solverIterations) {
	solver->setSolverIterations(solverIterations);
}

void bmx_ofx_ofxmsafluidsolver_enablevorticityconfinement(ofxMSAFluidSolver * solver, int value) {
	solver->enableVorticityConfinement(static_cast<bool>(value));
}

void bmx_ofx_ofxmsafluidsolver_setwrap(ofxMSAFluidSolver * solver, int bx, int by) {
	solver->setWrap(static_cast<bool>(bx), static_cast<bool>(by));
}

float * bmx_ofx_ofxmsafluidsolver_r(ofxMSAFluidSolver * solver) {
	return solver->r;
}

float * bmx_ofx_ofxmsafluidsolver_g(ofxMSAFluidSolver * solver) {
	return solver->g;
}

float * bmx_ofx_ofxmsafluidsolver_b(ofxMSAFluidSolver * solver) {
	return solver->b;
}

float * bmx_ofx_ofxmsafluidsolver_u(ofxMSAFluidSolver * solver) {
	return solver->u;
}

float * bmx_ofx_ofxmsafluidsolver_v(ofxMSAFluidSolver * solver) {
	return solver->v;
}

void bmx_ofx_ofxmsafluidsolver_update(ofxMSAFluidSolver * solver) {
	solver->update();
}

void bmx_ofx_ofxmsafluidsolver_reset(ofxMSAFluidSolver * solver) {
	solver->reset();
}

int bmx_ofx_ofxmsafluidsolver_getindexforcellposition(ofxMSAFluidSolver * solver, int x, int y) {
	return solver->getIndexForCellPosition(x, y);
}

int bmx_ofx_ofxmsafluidsolver_getindexfornormalizedposition(ofxMSAFluidSolver * solver, float x, float y) {
	return solver->getIndexForNormalizedPosition(x, y);
}

void bmx_ofx_ofxmsafluidsolver_free(ofxMSAFluidSolver * solver) {
	delete solver;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxParticleSystem * bmx_ofx_ofxparticlesystem_new() {
	return new ofxParticleSystem();
}

void bmx_ofx_ofxparticlesystem_init(ofxParticleSystem * system, ofxMSAFluidSolver * solver, int width, int height) {
	system->init(solver, width, height);
}

void bmx_ofx_ofxparticlesystem_updateanddraw(ofxParticleSystem * system, int renderUsingVA) {
	system->updateAndDraw(static_cast<bool>(renderUsingVA));
}

void bmx_ofx_ofxparticlesystem_addparticles(ofxParticleSystem * system, float x, float y, int count) {
	system->addParticles(x, y, count);
}

void bmx_ofx_ofxparticlesystem_free(ofxParticleSystem * system) {
	delete system;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofxMSAFluidDrawer * bmx_ofx_ofxmsafluiddrawer_new() {
	return new ofxMSAFluidDrawer();
}

void bmx_ofx_ofxmsafluiddrawer_setup(ofxMSAFluidDrawer * drawer, ofxMSAFluidSolver * solver) {
	drawer->setup(solver);
}

void bmx_ofx_ofxmsafluiddrawer_draw(ofxMSAFluidDrawer * drawer, int x, int y, int w, int h) {
	if (w == 0 || h == 0) {
		drawer->draw(x, y);
	} else {
		drawer->draw(x, y, w, h);
	}
}

void bmx_ofx_ofxmsafluiddrawer_free(ofxMSAFluidDrawer * drawer) {
	delete drawer;
}



