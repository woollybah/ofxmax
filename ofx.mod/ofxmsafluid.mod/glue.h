
#include "ofxMSAFluid.h"
#include "ParticleSystem.h"

extern "C" {

	ofxMSAFluidSolver * bmx_ofx_ofxmsafluidsolver_new();
	void bmx_ofx_ofxmsafluidsolver_setup(ofxMSAFluidSolver * solver, int nx, int ny);
	void bmx_ofx_ofxmsafluidsolver_setsize(ofxMSAFluidSolver * solver, int nx, int ny);
	void bmx_ofx_ofxmsafluidsolver_setvisc(ofxMSAFluidSolver * solver, float newVisc);
	void bmx_ofx_ofxmsafluidsolver_enablergb(ofxMSAFluidSolver * solver, int isRGB);
	void bmx_ofx_ofxmsafluidsolver_setdeltat(ofxMSAFluidSolver * solver, float dt);
	void bmx_ofx_ofxmsafluidsolver_setfadespeed(ofxMSAFluidSolver * solver, float fadeSpeed);
	void bmx_ofx_ofxmsafluidsolver_setsolveriterations(ofxMSAFluidSolver * solver, int solverIterations);
	void bmx_ofx_ofxmsafluidsolver_enablevorticityconfinement(ofxMSAFluidSolver * solver, int value);
	void bmx_ofx_ofxmsafluidsolver_setwrap(ofxMSAFluidSolver * solver, int bx, int by);
	float * bmx_ofx_ofxmsafluidsolver_r(ofxMSAFluidSolver * solver);
	float * bmx_ofx_ofxmsafluidsolver_g(ofxMSAFluidSolver * solver);
	float * bmx_ofx_ofxmsafluidsolver_b(ofxMSAFluidSolver * solver);
	float * bmx_ofx_ofxmsafluidsolver_u(ofxMSAFluidSolver * solver);
	float * bmx_ofx_ofxmsafluidsolver_v(ofxMSAFluidSolver * solver);
	void bmx_ofx_ofxmsafluidsolver_update(ofxMSAFluidSolver * solver);
	void bmx_ofx_ofxmsafluidsolver_reset(ofxMSAFluidSolver * solver);
	int bmx_ofx_ofxmsafluidsolver_getindexforcellposition(ofxMSAFluidSolver * solver, int x, int y);
	int bmx_ofx_ofxmsafluidsolver_getindexfornormalizedposition(ofxMSAFluidSolver * solver, float x, float y);

	ofxParticleSystem * bmx_ofx_ofxparticlesystem_new();
	void bmx_ofx_ofxparticlesystem_init(ofxParticleSystem * system, ofxMSAFluidSolver * solver, int width, int height);
	void bmx_ofx_ofxparticlesystem_updateanddraw(ofxParticleSystem * system, int renderUsingVA);
	void bmx_ofx_ofxparticlesystem_addparticles(ofxParticleSystem * system, float x, float y, int count);

	ofxMSAFluidDrawer * bmx_ofx_ofxmsafluiddrawer_new();
	void bmx_ofx_ofxmsafluiddrawer_setup(ofxMSAFluidDrawer * drawer, ofxMSAFluidSolver * solver);
	void bmx_ofx_ofxmsafluiddrawer_draw(ofxMSAFluidDrawer * drawer, int x, int y, int w, int h);


}

