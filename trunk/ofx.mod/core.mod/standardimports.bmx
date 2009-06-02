
'
' NOTE :
'
'  These are imports for use with the other modules.
'  Better this than duplicating it everywhere.
'

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

