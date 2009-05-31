' Copyright (c) 2009 Bruce A Henderson
' All rights reserved.
'
' Redistribution and use in source and binary forms, with or without
' modification, are permitted provided that the following conditions are met:
'     * Redistributions of source code must retain the above copyright
'       notice, this list of conditions and the following disclaimer.
'     * Redistributions in binary form must reproduce the above copyright
'       notice, this list of conditions and the following disclaimer in the
'       documentation and/or other materials provided with the distribution.
'     * Neither the name of Bruce A Henderson nor the
'       names of its contributors may be used to endorse or promote products
'       derived from this software without specific prior written permission.
'
' THIS SOFTWARE IS PROVIDED BY Bruce A Henderson ``AS IS'' AND ANY
' EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
' WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
' DISCLAIMED. IN NO EVENT SHALL Bruce A Henderson BE LIABLE FOR ANY
' DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
' (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
' LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
' ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
' (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
' SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'
SuperStrict

Import ofx.core

Import "../../bah.mod/freeimage.mod/src/*.h"
Import "../../bah.mod/fmod.mod/include/*.h"
Import "../../pub.mod/freetype.mod/include/*.h"
Import "../../pub.mod/freetype.mod/include/freetype/*.h"

Import "../core.mod/libs/openFrameworks/*.h"
Import "../core.mod/libs/openFrameworks/app/*.h"
Import "../core.mod/libs/openFrameworks/communication/*.h"
Import "../core.mod/libs/openFrameworks/events/*.h"
Import "../core.mod/libs/openFrameworks/graphics/*.h"
Import "../core.mod/libs/openFrameworks/sound/*.h"
Import "../core.mod/libs/openFrameworks/utils/*.h"
Import "../core.mod/libs/openFrameworks/video/*.h"

Import "../core.mod/libs/GLee/include/*.h"
Import "../core.mod/libs/poco/include/*.h"
Import "../core.mod/libs/rtAudio/include/*.h"

?win32
Import "../core.mod/libs/glu/*.h"
'Import "../core.mod/libs/glut/*.h"
Import "../core.mod/libs/videoInput/include/*.h"
Import "../core.mod/libs/quicktime/CIncludes/*.h"
?linux
Import "../core.mod/libs/unicap/include/*.h"
' NOTE : The follow headers should really be looked up via pkg-config....
'        This is likely to break on a different distro.
Import "/usr/include/gstreamer-0.10/*.h"
Import "/usr/include/glib-2.0/*.h"
Import "/usr/lib/glib-2.0/include/*.h"
Import "/usr/include/libxml2/*.h"
?

Import "ofxOpenCv/libs/opencv/include/*.h"
Import "ofxOpenCv/libs/opencv/include/*.hpp"
Import "ofxOpenCv/src/*.h"

Import "ofxOpenCv/src/ofxCvColorImage.cpp"
Import "ofxOpenCv/src/ofxCvShortImage.cpp"
Import "ofxOpenCv/src/ofxCvContourFinder.cpp"
Import "ofxOpenCv/src/ofxCvFloatImage.cpp"
Import "ofxOpenCv/src/ofxCvGrayscaleImage.cpp"
Import "ofxOpenCv/src/ofxCvImage.cpp"


Import "*.h"
Import "glue.cpp"
