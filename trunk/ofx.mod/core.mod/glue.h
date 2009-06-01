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

#include "ofMain.h"

class MaxofApp;
class MaxofAppWindow;

extern "C" {

#include "blitz.h"

	void _ofx_core_ofBaseApp__setup(BBObject * app);
	void _ofx_core_ofBaseApp__update(BBObject * app);
	void _ofx_core_ofBaseApp__draw(BBObject * app);
	void _ofx_core_ofBaseApp__keyPressed(BBObject * app, int key);
	void _ofx_core_ofBaseApp__keyReleased(BBObject * app, int key);
	void _ofx_core_ofBaseApp__mouseMoved(BBObject * app, int x, int y);
	void _ofx_core_ofBaseApp__mouseDragged(BBObject * app, int x, int y, int button);
	void _ofx_core_ofBaseApp__mousePressed(BBObject * app, int x, int y, int button);
	void _ofx_core_ofBaseApp__mouseReleased(BBObject * app, int x, int y, int button);
	void _ofx_core_ofBaseApp__windowResized(BBObject * app, int w, int h);

	void _ofx_core_ofAppBaseWindow__setupOpenGL(BBObject * window, int w, int h, int screenMode);
	void _ofx_core_ofAppBaseWindow__initializeWindow(BBObject * window);
	void _ofx_core_ofAppBaseWindow__runAppViaInfiniteLoop(BBObject * window, BBObject * app);
	void _ofx_core_ofAppBaseWindow__getWindowPosition(BBObject * window, int * x, int * y);
	void _ofx_core_ofAppBaseWindow__getWindowSize(BBObject * window, int * w, int * h);
	void _ofx_core_ofAppBaseWindow__hideCursor(BBObject * window);
	void _ofx_core_ofAppBaseWindow__showCursor(BBObject * window);

	void bmx_of_ofrunapp(ofBaseApp * app);
	void bmx_of_ofsetupopengl(ofAppBaseWindow * window, int w, int h, int screenMode);

	MaxofApp * bmx_of_ofbaseapp_new(BBObject * handle);

	ofVideoGrabber * bmx_of_ofvideograbber_new();
	int bmx_of_ofvideograbber_initgrabber(ofVideoGrabber * grab, int w, int h, int texture);
	void bmx_of_ofvideograbber_setverbose(ofVideoGrabber * grab, int verbose);
	void bmx_of_ofvideograbber_grabframe(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_draw(ofVideoGrabber * grab, float x, float y, float w, float h);
	int bmx_of_ofvideograbber_isframenew(ofVideoGrabber * grab);
	unsigned char * bmx_of_ofvideograbber_getpixels(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_videosettings(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_update(ofVideoGrabber * grab);
	float bmx_of_ofvideograbber_getheight(ofVideoGrabber * grab);
	float bmx_of_ofvideograbber_getwidth(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_setanchorpercent(ofVideoGrabber * grab, float xPct, float yPct);
	void bmx_of_ofvideograbber_setanchorpoint(ofVideoGrabber * grab, int x, int y);
	void bmx_of_ofvideograbber_resetanchor(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_setusetexture(ofVideoGrabber * grab, int use);
	void bmx_of_ofvideograbber_setdeviceid(ofVideoGrabber * grab, int deviceID);
	void bmx_of_ofvideograbber_listdevices(ofVideoGrabber * grab);
	void bmx_of_ofvideograbber_close(ofVideoGrabber * grab);

	ofTexture * bmx_of_oftexture_new();
	void bmx_of_oftexture_allocate(ofTexture * texture, int w, int h, int internalGlDataType);

	MaxofAppWindow * bmx_of_ofappbasewindow_new(BBObject * handle);


	void bmx_ofx_ofBackground(int r, int g, int b);
	void bmx_ofx_ofSetBackgroundAuto(int bManual);
	void bmx_ofx_ofSetRectMode(int _mode);
	int bmx_ofx_ofGetUsingArbTex();
	void bmx_ofx_ofEnableArbTex();
	void bmx_ofx_ofDisableArbTex();
	int bmx_ofx_ofbClearBg();
	int bmx_ofx_ofGetRectMode();
	void bmx_ofx_ofTriangle(float x1,float y1,float x2,float y2,float x3, float y3);
	void bmx_ofx_ofCircle(float x, float y, float radius);
	void bmx_ofx_ofEllipse(float x, float y, float width, float height);
	void bmx_ofx_ofLine(float x1, float y1, float x2, float y2);
	void bmx_ofx_ofRect(float x1, float y1, float w, float h);
	void bmx_ofx_ofSetCircleResolution(int res);
	void bmx_ofx_ofCurve(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3);
	void bmx_ofx_ofBezier(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3);
	void bmx_ofx_ofNoFill();
	void bmx_ofx_ofFill();
	void bmx_ofx_ofSetLineWidth(float lineWidth);
	void bmx_ofx_ofSetColor(int r, int g, int b, int a);
	void bmx_ofx_ofSetColorHex(int hexColor);
	void bmx_ofx_ofEnableAlphaBlending();
	void bmx_ofx_ofDisableAlphaBlending();
	void bmx_ofx_ofEnableSmoothing();
	void bmx_ofx_ofDisableSmoothing();
	void bmx_ofx_ofPushMatrix();
	void bmx_ofx_ofPopMatrix();
	void bmx_ofx_ofTranslate(float x, float y, float z);
	void bmx_ofx_ofScale(float xAmnt, float yAmnt, float zAmnt);
	void bmx_ofx_ofRotate(float degrees, float vecX, float vecY, float vecZ);
	void bmx_ofx_ofRotateX(float degrees);
	void bmx_ofx_ofRotateY(float degrees);
	void bmx_ofx_ofRotateZ(float degrees);
	void bmx_ofx_ofRotateDegrees(float degrees);
	void bmx_ofx_ofDrawBitmapString(BBString * text, float x, float y);
	void bmx_ofx_ofSetupGraphicDefaults();
	void bmx_ofx_ofSetupScreen();
	void bmx_ofx_ofCurveVertex(float x, float y);
	void bmx_ofx_ofBezierVertex(float x1, float y1, float x2, float y2, float x3, float y3);
	void bmx_ofx_ofSetPolyMode(int _mode);
	void bmx_ofx_ofBeginShape();
	void bmx_ofx_ofVertex(float x, float y);
	void bmx_ofx_ofEndShape(int bClose);
	void bmx_ofx_ofNextContour(int bClose);

	float bmx_ofx_ofGetFrameRate();
	int bmx_ofx_ofGetFrameNum();
	void bmx_ofx_ofSetFrameRate(int targetRate);
	void bmx_ofx_ofSleepMillis(int millis);
	void bmx_ofx_ofHideCursor();
	void bmx_ofx_ofShowCursor();
	int bmx_ofx_ofGetWindowPositionX();
	int bmx_ofx_ofGetWindowPositionY();
	int bmx_ofx_ofGetScreenWidth();
	int bmx_ofx_ofGetScreenHeight();
	int bmx_ofx_ofGetWindowMode();
	int bmx_ofx_ofGetWidth();
	int bmx_ofx_ofGetHeight();
	void bmx_ofx_ofSetWindowPosition(int x, int y);
	void bmx_ofx_ofSetWindowShape(int width, int height);
	void bmx_ofx_ofSetWindowTitle(BBString * title);
	void bmx_ofx_ofEnableSetupScreen();
	void bmx_ofx_ofDisableSetupScreen();
	void bmx_ofx_ofSetFullscreen(int fullscreen);
	void bmx_ofx_ofToggleFullscreen();
	void bmx_ofx_ofSetVerticalSync(int bSync);

	ofSoundPlayer * bmx_ofx_ofsoundplayer_new();
	void bmx_ofx_ofsoundplayer_loadsound(ofSoundPlayer * player, BBString * filename, int stream);
	void bmx_ofx_ofsoundplayer_play(ofSoundPlayer * player);
	void bmx_ofx_ofsoundplayer_setvolume(ofSoundPlayer * player, float vol);
	void bmx_ofx_ofsoundplayer_unloadsound(ofSoundPlayer * player);

	void bmx_ofx_ofsoundplayer_stop(ofSoundPlayer * player);
	void bmx_ofx_ofsoundplayer_setpan(ofSoundPlayer * player, float pan);
	void bmx_ofx_ofsoundplayer_setspeed(ofSoundPlayer * player, float speed);
	void bmx_ofx_ofsoundplayer_setpaused(ofSoundPlayer * player, int paused);
	void bmx_ofx_ofsoundplayer_setloop(ofSoundPlayer * player, int loop);
	void bmx_ofx_ofsoundplayer_setmultiplay(ofSoundPlayer * player, int mp);
	void bmx_ofx_ofsoundplayer_setposition(ofSoundPlayer * player, float pct);
	float bmx_ofx_ofsoundplayer_getposition(ofSoundPlayer * player);
	int bmx_ofx_ofsoundplayer_getisplaying(ofSoundPlayer * player);
	float bmx_ofx_ofsoundplayer_getspeed(ofSoundPlayer * player);
	float bmx_ofx_ofsoundplayer_getpan(ofSoundPlayer * player);


	void bmx_ofx_ofsoundplayer_ofSoundStopAll();
	void bmx_ofx_ofsoundplayer_ofSoundSetVolume(float vol);
	float * bmx_ofx_ofsoundplayer_ofSoundGetSpectrum(int bands);

	ofTexture * bmx_ofx_oftexture_new();

	ofTrueTypeFont * bmx_ofx_oftruetypefont_new();
	void bmx_ofx_oftruetypefont_loadfont(ofTrueTypeFont * font, BBString * filename, int _fontSize, int antiAliased, int fullCharacterSet, int makeContours);
	void bmx_ofx_oftruetypefont_drawstring(ofTrueTypeFont * font, BBString * text, float x, float y);

}


class MaxofApp : public ofBaseApp
{

public:

	MaxofApp(BBObject * handle);
	~MaxofApp();
		
	void setup();
	void update();
	void draw();
		
	void keyPressed(int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y );
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);


	BBObject * Handle() {
		return maxHandle;
	}
	
private:
	BBObject * maxHandle;
	

};

class MaxofAppWindow : public ofAppBaseWindow
{

public: 
	MaxofAppWindow(BBObject * handle);
	~MaxofAppWindow();

	void setupOpenGL(int w, int h, int screenMode);
	void initializeWindow();
	void runAppViaInfiniteLoop(ofBaseApp * appPtr);

	void hideCursor();
	void showCursor();

	void	setWindowPosition(int x, int y);
	void	setWindowShape(int w, int h);

	int		getFrameNum();
	float	getFrameRate();

	ofPoint	getWindowPosition();
	ofPoint	getWindowSize();
	ofPoint	getScreenSize();

	void	setFrameRate(float targetRate);
	void	setWindowTitle(string title);

	int getWindowMode();

	void	setFullscreen(bool fullscreen);
	void	toggleFullscreen();

	void	enableSetupScreen();
	void	disableSetupScreen();


private:
	BBObject * maxHandle;

};


