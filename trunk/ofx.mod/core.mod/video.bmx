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

Rem
bbdoc: Loads in a movie file, and offers various controls to play the movie, control the properties of the movie, and to access the pixels of a given frame.
End Rem
Type ofVideoPlayer Extends ofBaseVideo

	Rem
	bbdoc: Returns a pointer to the array of pixels that are RGB (width*height*3).
	about: For example, to get the red green and blue of the pixel (100,20):
	<pre>
	local pixels:byte ptr = myMovie.getPixels()
	local widthOfLine:int = myMovie.getWidth() * w  ' how long is a line of pixels
	local red:int = pixels[(20 * widthOfLine) + 100 * 3    ]
	local green:int = pixels[(20 * widthOfLine) + 100 * 3 + 1]
	local blue:int = pixels[(20 * widthOfLine) + 100 * 3 + 2]
	</pre>
	End Rem
	Method getPixels:Byte Ptr()
		Return bmx_of_ofvideoplayer_getpixels(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method close()
		bmx_of_ofvideoplayer_close(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method update() 
		bmx_of_ofvideoplayer_update(videoPtr)
	End Method
	
	Rem
	bbdoc: Draws the texture of the movie player at the position (x, y) with the optional given width (w) and height (h).
	End Rem
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0) 
		bmx_of_ofvideoplayer_draw(videoPtr, x, y, w, h)
	End Method
	
	Rem
	bbdoc: Returns the height of the movie.
	End Rem
	Method getHeight:Float() 
		Return bmx_of_ofvideoplayer_getheight(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the width of the movie.
	End Rem
	Method getWidth:Float() 
		Return bmx_of_ofvideoplayer_getwidth(videoPtr)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPercent(xPct:Float, yPct:Float) 
		bmx_of_ofvideoplayer_setanchorpercent(videoPtr, xPct, yPct)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setAnchorPoint(x:Int, y:Int) 
		bmx_of_ofvideoplayer_setanchorpoint(videoPtr, x, y)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method resetAnchor() 
		bmx_of_ofvideoplayer_resetanchor(videoPtr)
	End Method
	
	Rem
	bbdoc: Loads a movie file into the player.
	about: The movie does not automatically play once loaded.
	End Rem
	Method loadMovie:Int(name:String)
		Return bmx_of_ofvideoplayer_loadmovie(videoPtr, name)
	End Method
	
	Rem
	bbdoc: Closes the movie file and de-allocate resources
	End Rem
	Method closeMovie()
		bmx_of_ofvideoplayer_closemovie(videoPtr)
	End Method
	
	Rem
	bbdoc: Idles the movie player, so that the movie can play. (same as update())
	about: If you don't call it, when the movie is playing then you may encounter problems, especially on windows machines.
	End Rem
	Method idleMovie()
		bmx_of_ofvideoplayer_idlemovie(videoPtr)
	End Method
	
	Rem
	bbdoc: Plays the movie.
	about: If the movie has been stopped or paused it will the continue playback at the point it was stopped.
	End Rem
	Method play()
		bmx_of_ofvideoplayer_play(videoPtr)
	End Method
	
	Rem
	bbdoc: Stops the movie.
	End Rem
	Method stop()
		bmx_of_ofvideoplayer_stop(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the current speed of the movie. 1 = normal speed, 0 = paused, -1 = backwards.
	End Rem
	Method getSpeed:Float()
		Return bmx_of_ofvideoplayer_getspeed(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns True if a movie is loaded.
	End Rem
	Method isLoaded:Int()
		Return bmx_of_ofvideoplayer_isloaded(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns true if the frame of pixels is "new".
	about: For example, if the pixels are new, you could then process them.
	End Rem
	Method isFrameNew:Int()
		Return bmx_of_ofvideoplayer_isframenew(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the current playhead position, between 0 (start of movie) and 1 (end of movie).
	End Rem
	Method getPosition:Float()
		Return bmx_of_ofvideoplayer_getposition(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the duration, in seconds, of the movie.
	End Rem
	Method getDuration:Float()
		Return bmx_of_ofvideoplayer_getduration(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns True if the movie has finished.
	End Rem
	Method getIsMovieDone:Int()
		Return bmx_of_ofvideoplayer_getismoviedone(videoPtr)
	End Method
	
	Rem
	bbdoc: Sets the position of the playhead to a given percentage through the movie.
	about: Can be used to scrub through a movie.
	End Rem
	Method setPosition(pct:Float)
		bmx_of_ofvideoplayer_setposition(videoPtr, pct)
	End Method
	
	Rem
	bbdoc: Sets the volume of a movie - default = 0, silent
	End Rem
	Method setVolume(volume:Int)
		bmx_of_ofvideoplayer_setvolume(videoPtr, volume)
	End Method
	
	Rem
	bbdoc: Sets the looping state of the movie.
	about: Deafult behavior is to loop. There are three options:
	<ul>
	<li>OF_QT_LOOP_NONE - don't loop, the movie will stop when it gets to the last frame (or first frame, if playing backwards)</li>
	<li>OF_QT_LOOP_NORMAL - loop normally (the last frame loops to the first frame)</li>
	<li>OF_QT_LOOP_PALINDROME - loop back and forth</li>
	</ul>
	End Rem
	Method setLoopState(state:Int)
		bmx_of_ofvideoplayer_setloopstate(videoPtr, state)
	End Method
	
	Rem
	bbdoc: Sets the speed of the movie that is playing.
	about: 1 = normal, 2 = 2x as fast, 0 = stopped, -1 = backwards, etc;
	End Rem
	Method setSpeed(speed:Float)
		bmx_of_ofvideoplayer_setspeed(videoPtr, speed)
	End Method
	
	Rem
	bbdoc: 
	End Rem
	Method setFrame(frame:Int)
		bmx_of_ofvideoplayer_setframe(videoPtr, frame)
	End Method
	
	Rem
	bbdoc: Sets the paused state of the movie.
	about: Use True to pause and False to unpause.
	End Rem
	Method setPaused(pause:Int)
		bmx_of_ofvideoplayer_setpaused(videoPtr, pause)
	End Method
	
	Rem
	bbdoc: Returns the current frame.
	End Rem
	Method getCurrentFrame:Int()
		Return bmx_of_ofvideoplayer_getcurrentframe(videoPtr)
	End Method
	
	Rem
	bbdoc: Returns the total number of frames in the movie.
	End Rem
	Method getTotalNumFrames:Int()
		Return bmx_of_ofvideoplayer_gettotalnumframes(videoPtr)
	End Method
	
	Rem
	bbdoc: Moves to the first frame.
	End Rem
	Method firstFrame()
		bmx_of_ofvideoplayer_firstframe(videoPtr)
	End Method
	
	Rem
	bbdoc: Moves forward one frame.
	End Rem
	Method nextFrame()
		bmx_of_ofvideoplayer_nextframe(videoPtr)
	End Method
	
	Rem
	bbdoc: Moves backwards one frame.
	End Rem
	Method previousFrame()
		bmx_of_ofvideoplayer_previousframe(videoPtr)
	End Method

End Type


