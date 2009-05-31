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

Import "common.bmx"

Rem
bbdoc: Sets the background color.
about: It takes as input @r, @g, @b (0-255). The background is cleared automatically, just before the draw() command, so if the
background color is not changing, you could call this inside of setup() (once, at the start of the application). If the
background color is changing, you can call this inside of update().
End Rem
Function ofBackground(r:Int, g:Int, b:Int)
	bmx_ofx_ofBackground(r, g, b)
End Function


Rem
bbdoc: Sets the background clearing function to be auto (default) or not.
about: If non-auto, then background clearing will not occur per frame (at the start of draw) but rather, whenever #ofBackground is called.
End Rem
Function ofSetBackgroundAuto(bManual:Int)		' default is true
	bmx_ofx_ofSetBackgroundAuto(bManual)
End Function

Rem
bbdoc: Sets the mode for drawing rectangles, if they are corner aligned, or drawn so that the x, y position is the center of the rectangle.
about: Possible options are OF_RECTMODE_CENTER and OF_RECTMODE_CORNER.
End Rem
Function ofSetRectMode(_mode:Int)		' set the mode, either to OF_RECTMODE_CORNER or OF_RECTMODE_CENTER
	bmx_ofx_ofSetRectMode(_mode)
End Function

'set whether OF uses ARB rectangular texture or the more traditonal GL_TEXTURE_2D
Rem
bbdoc: 
End Rem
Function ofGetUsingArbTex:Int()
	Return bmx_ofx_ofGetUsingArbTex()
End Function

Rem
bbdoc: 
End Rem
Function ofEnableArbTex()
	bmx_ofx_ofEnableArbTex()
End Function

Rem
bbdoc: 
End Rem
Function ofDisableArbTex()
	bmx_ofx_ofDisableArbTex()
End Function

Rem
bbdoc: Tells you if background clearing is set to be automatic (returns true) or manual (returns false).
End Rem
Function ofbClearBg:Int()
	Return bmx_ofx_ofbClearBg()
End Function

Rem
bbdoc: Returns rect drawing mode, either OF_RECTMODE_CENTER (drawn from the center) or OF_RECTMODE_CORNER (drawn from the top left corner).
End Rem
Function ofGetRectMode:Int()				' default is OF_RECTMODE_CORNER
	Return bmx_ofx_ofGetRectMode()
End Function


' geometry 
Rem
bbdoc: Draws a triangle, with the three points: (x1, y1), (x2, y2), (x3, y3)
End Rem
Function ofTriangle(x1:Float,y1:Float,x2:Float,y2:Float,x3:Float, y3:Float)
	bmx_ofx_ofTriangle(x1, y1, x2, y2, x3, y3)
End Function

Rem
bbdoc: Draws a circle, centered at x,y, with a given radius.
about: The resolution of the circle (since it's actually drawn out of small triangles) is set at the start of the
program to 22, but this can be modified using #ofSetCircleResolution.
End Rem
Function ofCircle(x:Float, y:Float, radius:Float)
	bmx_ofx_ofCircle(x, y, radius)
End Function

Rem
bbdoc: Draws an ellipse from point (x,y) with a given width (w) and height (h)
End Rem
Function ofEllipse(x:Float, y:Float, width:Float, height:Float)
	bmx_ofx_ofEllipse(x, y, width, height)
End Function

Rem
bbdoc: Draws a line between two points, (x1,y1),(x2,y2)
End Rem
Function ofLine(x1:Float, y1:Float, x2:Float, y2:Float)
	bmx_ofx_ofLine(x1, y1, x2, y2)
End Function

Rem
bbdoc: Draws a rectangle from point x, y with a given width and height.
End Rem
Function ofRect(x1:Float, y1:Float, w:Float, h:Float)
	bmx_ofx_ofRect(x1, y1, w, h)
End Function

Rem
bbdoc: Sets the resolution for the #ofCircle command.
about: By default, the circle is 22 points, but if you need to draw larger circles, you can adjust the resolution using
this command. All circles are cached in OpenGL using a display list for optimization purposes.
End Rem
Function ofSetCircleResolution(res:Int)  		' if there 22 is a problem, you can change it here
	bmx_ofx_ofSetCircleResolution(res)
End Function

Rem
bbdoc: 
End Rem
Function ofCurve(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	bmx_ofx_ofCurve(x0, y0, x1, y1, x2, y2, x3, y3)
End Function

Rem
bbdoc: Draws a bezier curve from point (x0, y0) to point (x3, y3).
about: The curve is shaped by the two control points (x1,y1) and (x2,y2) in a way where they are the respective tangents for the
line at either ends.
End Rem
Function ofBezier(x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	bmx_ofx_ofBezier(x0, y0, x1, y1, x2, y2, x3, y3)
End Function

' drawing options
Rem
bbdoc: Draw shapes as outlines with the current draw color.
End Rem
Function ofNoFill()
	bmx_ofx_ofNoFill()
End Function

Rem
bbdoc: Draw shapes filled with the current draw color.
End Rem
Function ofFill()
	bmx_ofx_ofFill()
End Function

Rem
bbdoc: 
End Rem
Function ofSetLineWidth(lineWidth:Float)
	bmx_ofx_ofSetLineWidth(lineWidth)
End Function

Rem
bbdoc: Sets the draw color with r,g,b, 0-255.
about: For example, red ($ff0000) would be: ofSetColor(255,0,0);
End Rem
Function ofSetColor(r:Int, g:Int, b:Int, a:Int = -1) ' 0-255
	bmx_ofx_ofSetColor(r, g, b, a)
End Function

Rem
bbdoc: Sets the draw color with r,g,b, passed in as a hex.
about: Hex is a convenient way to write colors. Some examples:
<ul>
<li>ofSetColorHex($ffffff) ' white (255,255,255)</li>
<li>ofSetColorHex($000000) ' black (0,0,0)</li>
<li>ofSetColorHex($00ff00) ' green (0,255,0)</li>
</ul>
End Rem
Function ofSetColorHex(hexColor:Int) ' hex, like web 0xFF0033
	bmx_ofx_ofSetColorHex(hexColor)
End Function

' transparency
Rem
bbdoc: Enables Alpha blending.
End Rem
Function ofEnableAlphaBlending()  ' this just turns on and off opengl blending, the common mode
	bmx_ofx_ofEnableAlphaBlending()
End Function

Rem
bbdoc: Turns off alpha blending.
End Rem
Function ofDisableAlphaBlending()
	bmx_ofx_ofDisableAlphaBlending()
End Function

Rem
bbdoc: Turns on smoothing.
about: Currently, this only works for lines. You can draw a filled object, and then draw the outline with smoothing enabled
to get smoothing effects on filled shapes.
End Rem
Function ofEnableSmoothing()
	bmx_ofx_ofEnableSmoothing()
End Function

Rem
bbdoc: Turns off smoothing.
about: Currently, this only works for lines. You can draw a filled object, and then draw the outline with smoothing enabled
to get smoothing effects on filled shapes.
End Rem
Function ofDisableSmoothing()
	bmx_ofx_ofDisableSmoothing()
End Function

' drawing style - combines color, fill, blending and smoothing
'ofStyle ofGetStyle()
'function ofSetStyle(ofStyle style)
'function ofPushStyle()
'function ofPopStyle()

'our openGL wrappers
Rem
bbdoc: 
End Rem
Function ofPushMatrix()
	bmx_ofx_ofPushMatrix()
End Function

Rem
bbdoc: 
End Rem
Function ofPopMatrix()
	bmx_ofx_ofPopMatrix()
End Function

Rem
bbdoc: 
End Rem
Function ofTranslate(x:Float, y:Float, z:Float = 0)
	bmx_ofx_ofTranslate(x, y, z)
End Function

Rem
bbdoc: 
End Rem
Function ofScale(xAmnt:Float, yAmnt:Float, zAmnt:Float = 1)
	bmx_ofx_ofScale(xAmnt, yAmnt, xAmnt)
End Function

Rem
bbdoc: 
End Rem
Function ofRotate(degrees:Float, vecX:Float, vecY:Float, vecZ:Float)
	bmx_ofx_ofRotate(degrees, vecX, vecY, vecZ)
End Function

Rem
bbdoc: 
End Rem
Function ofRotateX(degrees:Float)
	bmx_ofx_ofRotateX(degrees)
End Function

Rem
bbdoc: 
End Rem
Function ofRotateY(degrees:Float)
	bmx_ofx_ofRotateY(degrees)
End Function

Rem
bbdoc: 
End Rem
Function ofRotateZ(degrees:Float)
	bmx_ofx_ofRotateZ(degrees)
End Function

Rem
bbdoc: 
End Rem
Function ofRotateDegrees(degrees:Float)
	bmx_ofx_ofRotateDegrees(degrees)
End Function

' bitmapped type
' ** note, this uses glDrawPixels and may be S L 0 W on some graphics cards
Rem
bbdoc: 
End Rem
Function ofDrawBitmapString(text:String, x:Float, y:Float)
	bmx_ofx_ofDrawBitmapString(text, x, y)
End Function


' screen coordinate things / default gl values
Rem
bbdoc: 
End Rem
Function ofSetupGraphicDefaults()
	bmx_ofx_ofSetupGraphicDefaults()
End Function

Rem
bbdoc: 
End Rem
Function ofSetupScreen()
	bmx_ofx_ofSetupScreen()
End Function

Rem
bbdoc: Specifies a single point of a shape.
about: The difference from #ofVertex is that the line describing the edge of the shape between two points will be a curve
as opposed to a straight line. The curve is automatically generated using the Catmull-Rom formula [1]. To be
called between #ofBeginShape() and #ofEndShape().
End Rem
Function ofCurveVertex(x:Float, y:Float)
	bmx_ofx_ofCurveVertex(x, y)
End Function

Rem
bbdoc: Describes a bezier curve through describing three points of its shape.
about: x1,y1 is the control point connected to the first end of the bezier (note example below). x2,y2 is the
control point connected to the other end of the bezier which is located at x3,y3. To be called between ofBeginShape() and ofEndShape().
<pre>
' draws a heart
ofSetPolyMode(OF_POLY_WINDING_NONZERO)
ofBeginShape()
  ofVertex(250, 175)  ' you need to start with a point!
  ofBezierVertex(375, 75, 425, 250, 250, 350) 
  ofBezierVertex(75, 250, 125, 75, 250, 175)
ofEndShape(True)
</pre>
End Rem
Function ofBezierVertex(x1:Float, y1:Float, x2:Float, y2:Float, x3:Float, y3:Float)
	bmx_ofx_ofBezierVertex(x1, y1, x2, y2, x3, y3)
End Function

Rem
bbdoc: Sets the drawing behavior for overlapping parts of the same polygon.
about: Possible modes are: OF_POLY_WINDING_ODD, OF_POLY_WINDING_NONZERO, OF_POLY_WINDING_POSITIVE, OF_POLY_WINDING_NEGATIVE or
OF_POLY_WINDING_ABS_GEQ_TWO.
End Rem
Function ofSetPolyMode(_mode:Int)	
	bmx_ofx_ofSetPolyMode(_mode)
End Function

Rem
bbdoc: Call this to start drawing a new shape.
about: Needs to be followed by a list of vertex points and lastly a call to #ofEndShape().
End Rem
Function ofBeginShape()
	bmx_ofx_ofBeginShape()
End Function

Rem
bbdoc: Specifies a single point of a shape.
about: To be called between #ofBeginShape() and #ofEndShape().
End Rem
Function ofVertex(x:Float, y:Float)
	bmx_ofx_ofVertex(x, y)
End Function

Rem
bbdoc: This tells the program that your shape is finished and that it should now draw it to the screen.
about: If you set the optional 'bClose' argument to true it will automatically close your shape for you. This
function must be called otherwise you will not see your shape.
End Rem
Function ofEndShape(bClose:Int = False)
	bmx_ofx_ofEndShape(bClose)
End Function

Rem
bbdoc: Allows you to draw multiple contours within one shape.
about: Call this between #ofBeginShape() and #ofEndShape() to create a new contour for your shape. If you set the optional argument
'bClose' to true then the previous contour will be automatically closed.
End Rem
Function ofNextContour(bClose:Int = False)  ' for multi contour shapes!
	bmx_ofx_ofNextContour(bClose)
End Function


