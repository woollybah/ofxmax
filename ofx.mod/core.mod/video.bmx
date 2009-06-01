SuperStrict

Import "texture.bmx"

Type ofBaseVideo

	Field videoPtr:Byte Ptr

	Method getPixels:Byte Ptr() Abstract
	
	Method close() Abstract
	
	Method update() Abstract
	
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0) Abstract
	
	Method getHeight:Float() Abstract
	
	Method getWidth:Float() Abstract
	
	Method setAnchorPercent(xPct:Float, yPct:Float) Abstract
	
	Method setAnchorPoint(x:Int, y:Int) Abstract
	
	Method resetAnchor() Abstract
	
End Type

Rem
bbdoc: 
End Rem
Type ofVideoGrabber Extends ofBaseVideo

	Field videoPtr:Byte Ptr
	
	Method New()
		videoPtr = bmx_of_ofvideograbber_new()
	End Method

	Rem
	bbdoc: Closes the sequence grabber and de-allocates any allocated resources.
	End Rem
	Method close()
		bmx_of_ofvideograbber_close(videoPtr)
	End Method
	
	Rem
	bbdoc: Initializes either the default capture device or the capture device specified by setDeviceID().
	about: Attempts to set up capture at the width and height specified. If the capture dimensions are not
	available it will set up capture for the next closest dimensions available. It is good to check what the
	actual size is before you start processing the pixels.
	End Rem
	Method initGrabber:Int(w:Int, h:Int, texture:Int = True)
		Return bmx_of_ofvideograbber_initgrabber(videoPtr, w, h, texture)
	End Method
	
	Rem
	bbdoc: Sets the verbosity - this can be useful for debugging the video grabber interface.
	about: You can set the verbosity and then try #initGrabber :
	<pre>
	myGrabber.setVerbose(True)
	myGrabber.initGrabber(320, 240)
 	</pre>
	End Rem
	Method setVerbose(verbose:Int)
		bmx_of_ofvideograbber_setverbose(videoPtr, verbose)
	End Method
	
	Rem
	bbdoc: This should be called regularly (for example, once per update) if you'd like to get new data from the sequence grabber.
	about: It will idle the video grabbing component so that you get new data.
	End Rem
	Method grabFrame()
		bmx_of_ofvideograbber_grabframe(videoPtr)
	End Method
	
	Rem
	bbdoc: Draws the internal texture of the movie grabber class at the position (x, y) with the optional width (w) and height (h). 
	about: If width and height are not set, will use the internal width and height of the movie grabber.
	End Rem
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0)
		bmx_of_ofvideograbber_draw(videoPtr, x, y, w, h)
	End Method

	Rem
	bbdoc: Returns True, if the current pixels have changed since the last time isFrameNew() was called.
	End Rem
	Method isFrameNew:Int()
		Return bmx_of_ofvideograbber_isframenew(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the pointer to the array of pixels that represents the current frame of live video.
	about: The data is stored as RGB, and in an array which is the size: width * height * 3.
	End Rem
	Method getPixels:Byte Ptr()
		Return bmx_of_ofvideograbber_getpixels(videoPtr)
	End Method

	Rem
	bbdoc: Loads the video settings on screen.
	about: If your application is full screen, this window might appear underneath the main window the first
	time you call this.
	End Rem
	Method videoSettings()
		bmx_of_ofvideograbber_videosettings(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method update()
		bmx_of_ofvideograbber_update(videoPtr)
	End Method

	Rem
	bbdoc: Returns the width of the movie grabber.
	End Rem
	Method getHeight:Float()
		Return bmx_of_ofvideograbber_getheight(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the height of the movie grabber.
	End Rem
	Method getWidth:Float()
		Return bmx_of_ofvideograbber_getwidth(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPercent(xPct:Float, yPct:Float)
		bmx_of_ofvideograbber_setanchorpercent(videoPtr, xPct, yPct)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPoint(x:Int, y:Int)
		bmx_of_ofvideograbber_setanchorpoint(videoPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method resetAnchor()
		bmx_of_ofvideograbber_resetanchor(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setUseTexture(use:Int)
		bmx_of_ofvideograbber_setusetexture(videoPtr, use)
	End Method
	
	Rem
	bbdoc: Selects a specific capture device specified by deviceID.
	about: Use #listDevices to see a list of available capture devices and their device IDs. 
	End Rem
	Method setDeviceID(deviceID:Int)
		bmx_of_ofvideograbber_setdeviceid(videoPtr, deviceID)
	End Method
	
	Rem
	bbdoc: Prints to the console a list of available capture devices with the device ID of each device.
	about: The device ID can then be used with setDeviceID() to specify a specific device to capture from.
	End Rem
	Method listDevices()
		bmx_of_ofvideograbber_listdevices(videoPtr)
	End Method

End Type


