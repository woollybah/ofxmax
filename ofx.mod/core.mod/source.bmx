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

Import BaH.FreeImage
Import BaH.FMOD
Import Pub.FreeType
Import BRL.Blitz

Import "../../bah.mod/freeimage.mod/src/*.h"
Import "../../bah.mod/fmod.mod/include/*.h"
Import "../../pub.mod/freetype.mod/include/*.h"
Import "../../pub.mod/freetype.mod/include/freetype/*.h"

Import "libs/openFrameworks/*.h"
Import "libs/openFrameworks/app/*.h"
Import "libs/openFrameworks/communication/*.h"
Import "libs/openFrameworks/events/*.h"
Import "libs/openFrameworks/graphics/*.h"
Import "libs/openFrameworks/sound/*.h"
Import "libs/openFrameworks/utils/*.h"
Import "libs/openFrameworks/video/*.h"

Import "libs/GLee/include/*.h"
Import "libs/poco/include/*.h"
Import "libs/rtAudio/include/*.h"

?win32
Import "libs/glu/*.h"
Import "libs/glut/*.h"
Import "libs/videoInput/include/*.h"
Import "libs/quicktime/CIncludes/*.h"
?linux
Import "libs/unicap/include/*.h"
' NOTE : The follow headers should really be looked up via pkg-config....
'        This is likely to break on a different distro.
Import "/usr/include/gstreamer-0.10/*.h"
Import "/usr/include/glib-2.0/*.h"
Import "/usr/lib/glib-2.0/include/*.h"
Import "/usr/include/libxml2/*.h"
?

'Import "libs/openFrameworks/app/ofAppGlutWindow.cpp"
Import "libs/openFrameworks/app/ofAppRunner.cpp"
Import "libs/openFrameworks/communication/ofArduino.cpp"
Import "libs/openFrameworks/communication/ofSerial.cpp"
Import "libs/openFrameworks/communication/ofStandardFirmata.cpp"
Import "libs/openFrameworks/graphics/ofBitmapFont.cpp"
Import "libs/openFrameworks/graphics/ofGraphics.cpp"
Import "libs/openFrameworks/graphics/ofImage.cpp"
Import "libs/openFrameworks/graphics/ofTexture.cpp"
Import "libs/openFrameworks/graphics/ofTrueTypeFont.cpp"
Import "libs/openFrameworks/sound/ofSoundPlayer.cpp"
Import "libs/openFrameworks/sound/ofSoundStream.cpp"
Import "libs/openFrameworks/utils/ofMath.cpp"
Import "libs/openFrameworks/utils/ofUtils.cpp"
Import "libs/openFrameworks/video/ofQtUtils.cpp"
Import "libs/openFrameworks/video/ofUCUtils.cpp"
Import "libs/openFrameworks/video/ofVideoGrabber.cpp"
Import "libs/openFrameworks/video/ofVideoPlayer.cpp"


Import "*.h"
Import "glue.cpp"

