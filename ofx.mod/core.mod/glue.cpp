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

MaxofApp::MaxofApp(BBObject * handle)
	: maxHandle(handle)
{
}

MaxofApp::~MaxofApp()
{
}

void MaxofApp::setup() {
	_ofx_core_ofBaseApp__setup(maxHandle);
}

void MaxofApp::update() {
	_ofx_core_ofBaseApp__update(maxHandle);
}
		
void MaxofApp::draw() {
	_ofx_core_ofBaseApp__draw(maxHandle);
}
		
void MaxofApp::keyPressed(int key) {
	_ofx_core_ofBaseApp__keyPressed(maxHandle, key);
}

void MaxofApp::keyReleased(int key) {
	_ofx_core_ofBaseApp__keyReleased(maxHandle, key);
}

void MaxofApp::mouseMoved(int x, int y ) {
	_ofx_core_ofBaseApp__mouseMoved(maxHandle, x, y);
}

void MaxofApp::mouseDragged(int x, int y, int button) {
	_ofx_core_ofBaseApp__mouseDragged(maxHandle, x, y, button);
}

void MaxofApp::mousePressed(int x, int y, int button) {
	_ofx_core_ofBaseApp__mousePressed(maxHandle, x, y, button);
}

void MaxofApp::mouseReleased(int x, int y, int button) {
	_ofx_core_ofBaseApp__mouseReleased(maxHandle, x, y, button);
}

void MaxofApp::windowResized(int w, int h) {

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MaxofAppWindow::MaxofAppWindow(BBObject * handle)
	: maxHandle(handle)
{
}

MaxofAppWindow::~MaxofAppWindow()
{
}

void MaxofAppWindow::setupOpenGL(int w, int h, int screenMode) {
	_ofx_core_ofAppBaseWindow__setupOpenGL(maxHandle, w, h, screenMode);
}

void MaxofAppWindow::initializeWindow() {
	_ofx_core_ofAppBaseWindow__initializeWindow(maxHandle);
}

void MaxofAppWindow::runAppViaInfiniteLoop(ofBaseApp * appPtr) {
	_ofx_core_ofAppBaseWindow__runAppViaInfiniteLoop(maxHandle, static_cast<MaxofApp*>(appPtr)->Handle());
}

void MaxofAppWindow::hideCursor() {
	_ofx_core_ofAppBaseWindow__hideCursor(maxHandle);
}

void MaxofAppWindow::showCursor() {
	_ofx_core_ofAppBaseWindow__showCursor(maxHandle);
}

void	MaxofAppWindow::setWindowPosition(int x, int y) {

}

void	MaxofAppWindow::setWindowShape(int w, int h) {

}

int MaxofAppWindow::getFrameNum() {
	return 0;
}

float MaxofAppWindow::getFrameRate() {
	return 0.0;
}


ofPoint MaxofAppWindow::getWindowPosition() {
	int x, y;
	_ofx_core_ofAppBaseWindow__getWindowPosition(maxHandle, &x, &y);
	return ofPoint(x, y);
}

ofPoint MaxofAppWindow::getWindowSize() {
	int w, h;
	_ofx_core_ofAppBaseWindow__getWindowSize(maxHandle, &w, &h);
	return ofPoint(w, h);
}

ofPoint MaxofAppWindow::getScreenSize() {
	return ofPoint();
}


void	MaxofAppWindow::setFrameRate(float targetRate) {

}

void	MaxofAppWindow::setWindowTitle(string title) {

}


int MaxofAppWindow::getWindowMode() {
	return 0;
}


void	MaxofAppWindow::setFullscreen(bool fullscreen) {

}

void	MaxofAppWindow::toggleFullscreen() {
	
}


void	MaxofAppWindow::enableSetupScreen() {

}

void	MaxofAppWindow::disableSetupScreen() {

}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_of_ofrunapp(ofBaseApp * app) {
	ofSetDataPathRoot("");
	ofRunApp(app);
}

void bmx_of_ofsetupopengl(ofAppBaseWindow * window, int w, int h, int screenMode) {
	ofSetupOpenGL(window, w, h, screenMode);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MaxofApp * bmx_of_ofbaseapp_new(BBObject * handle) {
	return new MaxofApp(handle);
}

void bmx_of_ofbaseapp_keypressed(MaxofApp * app, int key) {
	app->keyPressed(key);
}

void bmx_of_ofbaseapp_keyreleased(MaxofApp * app, int key) {
	app->keyReleased(key);
}

void bmx_of_ofbaseapp_mousepressed(MaxofApp * app, int button, int x, int y) {
	app->mousePressed(x, y, button);
}

void bmx_of_ofbaseapp_mousereleased(MaxofApp * app, int button, int x, int y) {
	app->mouseReleased(x, y, button);
}

void bmx_of_ofbaseapp_mousedragged(MaxofApp * app, int x, int y, int buttonInUse) {
	app->mouseDragged(x, y, buttonInUse);
}

void bmx_of_ofbaseapp_mousemoved(MaxofApp * app, int x, int y) {
	app->mouseMoved(x, y);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofVideoGrabber * bmx_of_ofvideograbber_new() {
	return new ofVideoGrabber();
}

int bmx_of_ofvideograbber_initgrabber(ofVideoGrabber * grab, int w, int h, int texture) {
	return static_cast<int>(grab->initGrabber(w, h, static_cast<bool>(texture)));
}

void bmx_of_ofvideograbber_setverbose(ofVideoGrabber * grab, int verbose) {
	grab->setVerbose(static_cast<bool>(verbose));
}

void bmx_of_ofvideograbber_grabframe(ofVideoGrabber * grab) {
	grab->grabFrame();
}

void bmx_of_ofvideograbber_draw(ofVideoGrabber * grab, float x, float y, float w, float h) {
	if (w == 0 || h == 0) {
		grab->draw(x, y);
	} else {
		grab->draw(x, y, w, h);
	}
}

int bmx_of_ofvideograbber_isframenew(ofVideoGrabber * grab) {
	return static_cast<int>(grab->isFrameNew());
}

unsigned char * bmx_of_ofvideograbber_getpixels(ofVideoGrabber * grab) {
	return grab->getPixels();
}

void bmx_of_ofvideograbber_videosettings(ofVideoGrabber * grab) {
	grab->videoSettings();
}

void bmx_of_ofvideograbber_update(ofVideoGrabber * grab) {
	grab->update();
}

float bmx_of_ofvideograbber_getheight(ofVideoGrabber * grab) {
	return grab->getHeight();
}

float bmx_of_ofvideograbber_getwidth(ofVideoGrabber * grab) {
	return grab->getWidth();
}

void bmx_of_ofvideograbber_setanchorpercent(ofVideoGrabber * grab, float xPct, float yPct) {
	grab->setAnchorPercent(xPct, yPct);
}

void bmx_of_ofvideograbber_setanchorpoint(ofVideoGrabber * grab, int x, int y) {
	grab->setAnchorPoint(x, y);
}

void bmx_of_ofvideograbber_resetanchor(ofVideoGrabber * grab) {
	grab->resetAnchor();
}

void bmx_of_ofvideograbber_setusetexture(ofVideoGrabber * grab, int use) {
	grab->setUseTexture(static_cast<bool>(use));
}

void bmx_of_ofvideograbber_setdeviceid(ofVideoGrabber * grab, int deviceID) {
	grab->setDeviceID(deviceID);
}

void bmx_of_ofvideograbber_listdevices(ofVideoGrabber * grab) {
	grab->listDevices();
}

void bmx_of_ofvideograbber_close(ofVideoGrabber * grab) {
	grab->close();
}

void bmx_of_ofvideograbber_free(ofVideoGrabber * grab) {
	delete grab;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofTexture * bmx_of_oftexture_new() {
	return new ofTexture();
}

void bmx_of_oftexture_allocate(ofTexture * texture, int w, int h, int internalGlDataType) {
	texture->allocate(w, h, internalGlDataType);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

MaxofAppWindow * bmx_of_ofappbasewindow_new(BBObject * handle) {
	return new MaxofAppWindow(handle);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

void bmx_ofx_ofBackground(int r, int g, int b) {
	ofBackground(r, g, b);
}

void bmx_ofx_ofSetBackgroundAuto(int bManual) {
	ofSetBackgroundAuto(bManual);
}

void bmx_ofx_ofSetRectMode(int _mode) {
	ofSetRectMode(_mode);
}

int bmx_ofx_ofGetUsingArbTex() {
	return static_cast<int>(ofGetUsingArbTex());
}

void bmx_ofx_ofEnableArbTex() {
	ofEnableArbTex();
}

void bmx_ofx_ofDisableArbTex() {
	ofDisableArbTex();
}

int bmx_ofx_ofbClearBg() {
	return static_cast<int>(ofbClearBg());
}

int bmx_ofx_ofGetRectMode() {
	return ofGetRectMode();
}

void bmx_ofx_ofTriangle(float x1,float y1,float x2,float y2,float x3, float y3) {
	ofTriangle(x1, y1, x2, y2, x3, y3);
}

void bmx_ofx_ofCircle(float x, float y, float radius) {
	ofCircle(x, y, radius);
}

void bmx_ofx_ofEllipse(float x, float y, float width, float height) {
	ofEllipse(x, y, width, height);
}

void bmx_ofx_ofLine(float x1, float y1, float x2, float y2) {
	ofLine(x1, y1, x2, y2);
}

void bmx_ofx_ofRect(float x1, float y1, float w, float h) {
	ofRect(x1, y1, w, h);
}

void bmx_ofx_ofSetCircleResolution(int res) {
	ofSetCircleResolution(res);
}

void bmx_ofx_ofCurve(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
	ofCurve(x0, y0, x1, y1, x2, y2, x3, y3);
}

void bmx_ofx_ofBezier(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
	ofBezier(x0, y0, x1, y1, x2, y2, x3, y3);
}

void bmx_ofx_ofNoFill() {
	ofNoFill();
}

void bmx_ofx_ofFill() {
	ofFill();
}

void bmx_ofx_ofSetLineWidth(float lineWidth) {
	ofSetLineWidth(lineWidth);
}

void bmx_ofx_ofSetColor(int r, int g, int b, int a) {
	if (a < 0) {
		ofSetColor(r, g, b);
	} else {
		ofSetColor(r, g, b, a);
	}
}

void bmx_ofx_ofSetColorHex(int hexColor) {
	ofSetColor(hexColor);
}

void bmx_ofx_ofEnableAlphaBlending() {
	ofEnableAlphaBlending();
}

void bmx_ofx_ofDisableAlphaBlending() {
	ofDisableAlphaBlending();
}

void bmx_ofx_ofEnableSmoothing() {
	ofEnableSmoothing();
}

void bmx_ofx_ofDisableSmoothing() {
	ofDisableSmoothing();
}

void bmx_ofx_ofPushMatrix() {
	ofPushMatrix();
}

void bmx_ofx_ofPopMatrix() {
	ofPopMatrix();
}

void bmx_ofx_ofTranslate(float x, float y, float z) {
	ofTranslate(x, y, z);
}

void bmx_ofx_ofScale(float xAmnt, float yAmnt, float zAmnt) {
	ofScale(xAmnt, yAmnt, zAmnt);
}

void bmx_ofx_ofRotate(float degrees, float vecX, float vecY, float vecZ) {
	ofRotate(degrees, vecX, vecY, vecZ);
}

void bmx_ofx_ofRotateX(float degrees) {
	ofRotateX(degrees);
}

void bmx_ofx_ofRotateY(float degrees) {
	ofRotateY(degrees);
}

void bmx_ofx_ofRotateZ(float degrees) {
	ofRotateZ(degrees);
}

void bmx_ofx_ofRotateDegrees(float degrees) {
	ofRotate(degrees);
}

void bmx_ofx_ofDrawBitmapString(BBString * text, float x, float y) {
	char * c = bbStringToCString(text);
	ofDrawBitmapString(c, x, y);
	bbMemFree(c);
}

void bmx_ofx_ofSetupGraphicDefaults() {
	ofSetupGraphicDefaults();
}

void bmx_ofx_ofSetupScreen() {
	ofSetupScreen();
}

void bmx_ofx_ofCurveVertex(float x, float y) {
	ofCurveVertex(x, y);
}

void bmx_ofx_ofBezierVertex(float x1, float y1, float x2, float y2, float x3, float y3) {
	ofBezierVertex(x1, y1, x2, y2, x3, y3);
}

void bmx_ofx_ofSetPolyMode(int _mode) {
	ofSetPolyMode(_mode);
}

void bmx_ofx_ofBeginShape() {
	ofBeginShape();
}

void bmx_ofx_ofVertex(float x, float y) {
	ofVertex(x, y);
}

void bmx_ofx_ofEndShape(int bClose) {
	ofEndShape(static_cast<bool>(bClose));
}

void bmx_ofx_ofNextContour(int bClose) {
	ofNextContour(static_cast<bool>(bClose));
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

float bmx_ofx_ofGetFrameRate() {
	return ofGetFrameRate();
}

int bmx_ofx_ofGetFrameNum() {
	return ofGetFrameNum();
}

void bmx_ofx_ofSetFrameRate(int targetRate) {
	ofSetFrameRate(targetRate);
}

void bmx_ofx_ofSleepMillis(int millis) {
	ofSleepMillis(millis);
}

void bmx_ofx_ofHideCursor() {
	ofHideCursor();
}

void bmx_ofx_ofShowCursor() {
	ofShowCursor();
}

int bmx_ofx_ofGetWindowPositionX() {
	return ofGetWindowPositionX();
}

int bmx_ofx_ofGetWindowPositionY() {
	return ofGetWindowPositionY();
}

int bmx_ofx_ofGetScreenWidth() {
	return ofGetScreenWidth();
}

int bmx_ofx_ofGetScreenHeight() {
	return ofGetScreenHeight();
}

int bmx_ofx_ofGetWindowMode() {
	return ofGetWindowMode();
}

int bmx_ofx_ofGetWidth() {
	return ofGetWidth();
}

int bmx_ofx_ofGetHeight() {
	return ofGetHeight();
}

void bmx_ofx_ofSetWindowPosition(int x, int y) {
	ofSetWindowPosition(x, y);
}

void bmx_ofx_ofSetWindowShape(int width, int height) {
	ofSetWindowShape(width, height);
}

void bmx_ofx_ofSetWindowTitle(BBString * title) {
	char * c = bbStringToCString(title);
	ofSetWindowTitle(c);
	bbMemFree(c);
}

void bmx_ofx_ofEnableSetupScreen() {
	ofEnableSetupScreen();
}

void bmx_ofx_ofDisableSetupScreen() {
	ofDisableSetupScreen();
}

void bmx_ofx_ofSetFullscreen(int fullscreen) {
	ofSetFullscreen(static_cast<bool>(fullscreen));
}

void bmx_ofx_ofToggleFullscreen() {
	ofToggleFullscreen();
}

void bmx_ofx_ofSetVerticalSync(int bSync) {
	ofSetVerticalSync(static_cast<bool>(bSync));
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


ofTexture * bmx_ofx_oftexture_new() {
	return new ofTexture();
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofTrueTypeFont * bmx_ofx_oftruetypefont_new() {
	return new ofTrueTypeFont();
}

void bmx_ofx_oftruetypefont_loadfont(ofTrueTypeFont * font, BBString * filename, int _fontSize, int antiAliased, int fullCharacterSet, int makeContours) {
	char * c = bbStringToCString(filename);
	font->loadFont(c, _fontSize, static_cast<bool>(antiAliased), static_cast<bool>(fullCharacterSet), static_cast<bool>(makeContours));
	bbMemFree(c);
}

void bmx_ofx_oftruetypefont_drawstring(ofTrueTypeFont * font, BBString * text, float x, float y) {
	char * c = bbStringToCString(text);
	font->drawString(c, x, y);
	bbMemFree(c);
}

float bmx_ofx_oftruetypefont_getlineheight(ofTrueTypeFont * font) {
	return font->getLineHeight();
}

void bmx_ofx_oftruetypefont_setlineheight(ofTrueTypeFont * font, float height) {
	font->setLineHeight(height);
}

float bmx_ofx_oftruetypefont_stringwidth(ofTrueTypeFont * font, BBString * s) {
	char * c = bbStringToCString(s);
	float w = font->stringWidth(c);
	bbMemFree(c);
	return w;
}

float bmx_ofx_oftruetypefont_stringheight(ofTrueTypeFont * font, BBString * s) {
	char * c = bbStringToCString(s);
	float h = font->stringHeight(c);
	bbMemFree(c);
	return h;
}

void bmx_ofx_oftruetypefont_getstringboundingbox(ofTrueTypeFont * font, BBString * s, float x, float y, float * bbX, float * bbY, float * bbW, float * bbH) {
	char * c = bbStringToCString(s);
	ofRectangle r = font->getStringBoundingBox(c, x, y);
	bbMemFree(c);
	*bbX = r.x;
	*bbY = r.y;
	*bbW = r.width;
	*bbH = r.height;
}

void bmx_ofx_oftruetypefont_drawstringasshapes(ofTrueTypeFont * font, BBString * s, float x, float y) {
	char * c = bbStringToCString(s);
	font->drawStringAsShapes(c, x, y);
	bbMemFree(c);
}

int bmx_ofx_oftruetypefont_countcharacters(ofTrueTypeFont * font) {
	return font->nCharacters;
}

void bmx_ofx_oftruetypefont_free(ofTrueTypeFont * font) {
	delete font;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

ofVideoPlayer * bmx_of_ofvideoplayer_new() {
	return new ofVideoPlayer;
}

unsigned char * bmx_of_ofvideoplayer_getpixels(ofVideoPlayer * player) {
	return player->getPixels();
}

void bmx_of_ofvideoplayer_close(ofVideoPlayer * player) {
	player->close();
}

void bmx_of_ofvideoplayer_update(ofVideoPlayer * player) {
	player->update();
}

void bmx_of_ofvideoplayer_draw(ofVideoPlayer * player, float x, float y, float w, float h) {
	if (w == 0 || h == 0) {
		player->draw(x, y);
	} else {
		player->draw(x, y, w, h);
	}
}

float bmx_of_ofvideoplayer_getheight(ofVideoPlayer * player) {
	return player->getHeight();
}

float bmx_of_ofvideoplayer_getwidth(ofVideoPlayer * player) {
	return player->getWidth();
}

void bmx_of_ofvideoplayer_setanchorpercent(ofVideoPlayer * player, float xPct, float yPct) {
	player->setAnchorPercent(xPct, yPct);
}

void bmx_of_ofvideoplayer_setanchorpoint(ofVideoPlayer * player, int x, int y) {
	player->setAnchorPoint(x, y);
}

void bmx_of_ofvideoplayer_resetanchor(ofVideoPlayer * player) {
	player->resetAnchor();
}

int bmx_of_ofvideoplayer_loadmovie(ofVideoPlayer * player, BBString * name) {
	char * c = bbStringToCString(name);
	int res = static_cast<int>(player->loadMovie(c));
	bbMemFree(c);
	return res;
}

void bmx_of_ofvideoplayer_closemovie(ofVideoPlayer * player) {
	player->closeMovie();
}

void bmx_of_ofvideoplayer_idlemovie(ofVideoPlayer * player) {
	player->idleMovie();
}

void bmx_of_ofvideoplayer_play(ofVideoPlayer * player) {
	player->play();
}

void bmx_of_ofvideoplayer_stop(ofVideoPlayer * player) {
	player->stop();
}

float bmx_of_ofvideoplayer_getspeed(ofVideoPlayer * player) {
	return player->getSpeed();
}

int bmx_of_ofvideoplayer_isloaded(ofVideoPlayer * player) {
	return static_cast<int>(player->bLoaded);
}

int bmx_of_ofvideoplayer_isframenew(ofVideoPlayer * player) {
	return static_cast<int>(player->isFrameNew());
}

float bmx_of_ofvideoplayer_getposition(ofVideoPlayer * player) {
	return player->getPosition();
}

float bmx_of_ofvideoplayer_getduration(ofVideoPlayer * player) {
	return player->getDuration();
}

int bmx_of_ofvideoplayer_getismoviedone(ofVideoPlayer * player) {
	return static_cast<int>(player->getIsMovieDone());
}

void bmx_of_ofvideoplayer_setposition(ofVideoPlayer * player, float pct) {
	player->setPosition(pct);
}

void bmx_of_ofvideoplayer_setvolume(ofVideoPlayer * player, int volume) {
	player->setVolume(volume);
}

void bmx_of_ofvideoplayer_setloopstate(ofVideoPlayer * player, int state) {
	player->setLoopState(state);
}

void bmx_of_ofvideoplayer_setspeed(ofVideoPlayer * player, float speed) {
	player->setSpeed(speed);
}

void bmx_of_ofvideoplayer_setframe(ofVideoPlayer * player, int frame) {
	player->setFrame(frame);
}

void bmx_of_ofvideoplayer_setpaused(ofVideoPlayer * player, int pause) {
	player->setPaused(static_cast<bool>(pause));
}

int bmx_of_ofvideoplayer_getcurrentframe(ofVideoPlayer * player) {
	return player->getCurrentFrame();
}

int bmx_of_ofvideoplayer_gettotalnumframes(ofVideoPlayer * player) {
	return player->getTotalNumFrames();
}

void bmx_of_ofvideoplayer_firstframe(ofVideoPlayer * player) {
	player->firstFrame();
}

void bmx_of_ofvideoplayer_nextframe(ofVideoPlayer * player) {
	player->nextFrame();
}

void bmx_of_ofvideoplayer_previousframe(ofVideoPlayer * player) {
	player->previousFrame();
}

void bmx_of_ofvideoplayer_free(ofVideoPlayer * player) {
	delete player;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


ofImage * bmx_of_image_new() {
	return new ofImage;
}

void bmx_of_image_allocate(ofImage * image, int w, int h, int _type) {
	image->allocate(w, h, _type);
}

void bmx_of_image_clear(ofImage * image) {
	image->clear();
}

void bmx_of_image_setusetexture(ofImage * image, int use) {
	image->setUseTexture(static_cast<bool>(use));
}

ofTexture * bmx_of_image_gettexturereference(ofImage * image) {
	return &image->getTextureReference();
}

int bmx_of_image_loadimage(ofImage * image, BBString * fileName) {
	char * f = bbStringToCString(fileName);
	int res = static_cast<int>(image->loadImage(f));
	bbMemFree(f);
	return res;
}

void bmx_of_image_saveimage(ofImage * image, BBString * fileName) {
	char * f = bbStringToCString(fileName);
	image->saveImage(f);
	bbMemFree(f);
}

unsigned char * bmx_of_image_getpixels(ofImage * image) {
	return image->getPixels();
}

void bmx_of_image_setfrompixels(ofImage * image, unsigned char * pixels, int w, int h, int newType, int orderIsRGB) {
	image->setFromPixels(pixels, w, h, newType, static_cast<bool>(orderIsRGB));
}

void bmx_of_image_setimagetype(ofImage * image, int _type) {
	image->setImageType(_type);
}

void bmx_of_image_resize(ofImage * image, int newWidth, int newHeight) {
	image->resize(newWidth, newHeight);
}

void bmx_of_image_grabscreen(ofImage * image, int x, int y, int w, int h) {
	image->grabScreen(x, y, w, h);
}

void bmx_of_image_update(ofImage * image) {
	image->update();
}

void bmx_of_image_setanchorpercent(ofImage * image, float xPct, float yPct) {
	image->setAnchorPercent(xPct, yPct);
}

void bmx_of_image_setanchorpoint(ofImage * image, int x, int y) {
	image->setAnchorPoint(x, y);
}

void bmx_of_image_resetanchor(ofImage * image) {
	image->resetAnchor();
}

void bmx_of_image_draw(ofImage * image, float x, float y, float w, float h) {
	if (w == 0 && h == 0) {
		image->draw(x, y);
	} else {
		image->draw(x, y, w, h);
	}
}

float bmx_of_image_getheight(ofImage * image) {
	return image->getHeight();
}

float bmx_of_image_getwidth(ofImage * image) {
	return image->getWidth();
}

void bmx_of_image_free(ofImage * image) {
	delete image;
}

int bmx_og_image_gettype(ofImage * image) {
	return image->type;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++

int bmx_ofx_ofGetElapsedTimeMillis() {
	return ofGetElapsedTimeMillis();
}

float bmx_ofx_ofGetElapsedTimef() {
	return ofGetElapsedTimef();
}

void bmx_ofx_ofResetElapsedTimeCounter() {
	ofResetElapsedTimeCounter();
}
