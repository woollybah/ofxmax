SuperStrict

Import ofx.core
Import ofx.ofxopencv
Import BRL.Blitz

' NOTE : doesn't currently work with BMK...
' Include "../core.mod/standardimports.bmx"

' -----------------------------------------------
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
' -----------------------------------------------

Import "../ofxopencv.mod/ofxOpenCv/libs/opencv/include/*.h"
Import "../ofxopencv.mod/ofxOpenCv/libs/opencv/include/*.hpp"
Import "../ofxopencv.mod/ofxOpenCv/src/*.h"


Import "src/*.h"
Import "src/libfidtrack/*.h"

Import "src/ofxFiducialFinder.cpp"
Import "src/ofxFiducialTracker.cpp"

Import "src/libfidtrack/fidtrackX.cpp"
Import "src/libfidtrack/segment.cpp"
Import "src/libfidtrack/treeidmap.cpp"

Import "*.h"
Import "glue.cpp"


