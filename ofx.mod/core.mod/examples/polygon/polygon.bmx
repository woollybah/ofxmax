SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d
Import brl.random

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 1024, 768, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field nCurveVertexes:Int
	Field curveVertices:draggableVertex[7]
	Field bezierVertices:draggableVertex[4]

		
	Method setup()
		ofBackground(255,255,255)
		ofSetFrameRate(60)
		
		nCurveVertexes = 7
		
		For Local i:Int = 0 Until nCurveVertexes
			curveVertices[i] = New draggableVertex
			curveVertices[i].bOver = False
			curveVertices[i].bBeingDragged = False
			curveVertices[i].radius = 4
		Next
		
		curveVertices[0].x = 326
		curveVertices[0].y = 209
		curveVertices[1].x = 306
		curveVertices[1].y = 279
		curveVertices[2].x = 265
		curveVertices[2].y = 331
		curveVertices[3].x = 304
		curveVertices[3].y = 383
		curveVertices[4].x = 374
		curveVertices[4].y = 383
		curveVertices[5].x = 418
		curveVertices[5].y = 309
		curveVertices[6].x = 345
		curveVertices[6].y = 279
		
	End Method
	
	Method update()
		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		ofFill()
		ofSetColorHex($e0be21)
		
		'------(a)--------------------------------------
		' 
		' 		draw a star
		'
		' 		use poly winding odd, the default rule
		'
		' 		info about the winding rules is here:
		'		http:'glprogramming.com/red/images/Image128.gif
		' 
		ofSetPolyMode(OF_POLY_WINDING_ODD)	' this is the normal mode
		ofBeginShape()
			ofVertex(200,135)
			ofVertex(15,135)
			ofVertex(165,25)
			ofVertex(105,200)
			ofVertex(50,25)
		ofEndShape()
		
		
		'------(b)--------------------------------------
		' 
		' 		draw a star
		'
		' 		use poly winding nonzero
		'
		' 		info about the winding rules is here:
		'		http:'glprogramming.com/red/images/Image128.gif
		' 
		ofSetColorHex($b5de10)
		ofSetPolyMode(OF_POLY_WINDING_NONZERO)
		ofBeginShape()
			ofVertex(400,135)
			ofVertex(215,135)
			ofVertex(365,25)
			ofVertex(305,200)
			ofVertex(250,25)
		ofEndShape()
		'-------------------------------------
		
		
		
		'------(c)--------------------------------------
		' 
		' 		draw a star dynamically
		'
		' 		use the mouse position as a pct
		'		to calc nPoints and internal point radius
		'
		Local xPct:Float = MouseX() / Float(ofGetWidth())
		Local yPct:Float = MouseY() / Float(ofGetHeight())
		Local nTips:Int = 5 + xPct * 60
		Local nStarPts:Int = nTips * 2
		Local angleChangePerPt:Float = TWO_PI / Float(nStarPts) * RAD_TO_DEG
		Local innerRadius:Float = 0 + yPct*80
		Local outerRadius:Float = 80
		Local origx:Float = 525
		Local origy:Float = 100
		Local angle:Float = 0

		ofSetColorHex($a16bca)
		ofBeginShape()
		For Local i:Int = 0 Until nStarPts
			If i Mod 2 = 0 Then
				' inside point:
				Local x:Float = origx + innerRadius * Cos(angle)
				Local y:Float = origy + innerRadius * Sin(angle)
				ofVertex(x,y)
			Else
				' outside point
				Local x:Float = origx + outerRadius * Cos(angle)
				Local y:Float = origy + outerRadius * Sin(angle)
				ofVertex(x,y)
			End If
			angle :+ angleChangePerPt
		Next
		ofEndShape()
		'-------------------------------------
		
		'------(d)--------------------------------------
		' 
		' 		poylgon of random points
		'
		' 		lots of self intersection, 500 pts is a good stress test
		' 
		' 
		ofSetColorHex($0cb0b6)
		ofSetPolyMode(OF_POLY_WINDING_ODD)
		ofBeginShape()
		For Local i:Int = 0 Until 10
			ofVertex(Rand(650,850), Rand(20,200))
		Next
		ofEndShape()
		'-------------------------------------
		
		
		'------(e)--------------------------------------
		' 
		' 		use sin cos and time to make some spirally shape
		'
		glPushMatrix()
			glTranslatef(100,300,0)
			ofSetColorHex($ff2220)
			ofFill()
			ofSetPolyMode(OF_POLY_WINDING_ODD)
			ofBeginShape()
			Local angleStep:Float = TWO_PI/(100.0 + Sin(ofGetElapsedTimef()/5.0) * 60) * RAD_TO_DEG
			Local radiusAdder:Float = 0.5
			Local radius:Float = 0
			For Local i:Int = 0 Until 200
				Local anglef:Float = (i) * angleStep
				Local x:Float = radius * Cos(anglef)
				Local y:Float = radius * Sin(anglef) 
				ofVertex(x,y)
				radius :+ radiusAdder 
			Next
			ofEndShape(True)
		glPopMatrix()
		'-------------------------------------
		
		'------(f)--------------------------------------
		' 
		' 		ofCurveVertex
		' 
		' 		because it uses catmul rom splines, we need to repeat the first and last 
		' 		items so the curve actually goes through those points
		'
		
		ofSetColorHex($2bdbe6)
		ofBeginShape()
		
			For Local i:Int = 0 Until nCurveVertexes
				
				' sorry about all the if/states here, but to do catmull rom curves
				' we need to duplicate the start and end points so the curve acutally 
				' goes through them.
				
				' for i == 0, we just call the vertex twice
				' for i == nCurveVertexes-1 (last point) we call vertex 0 twice
				' otherwise just normal ofCurveVertex call
				
				If i = 0 Then
					ofCurveVertex(curveVertices[0].x, curveVertices[0].y) ' we need to duplicate 0 for the curve to start at point 0
					ofCurveVertex(curveVertices[0].x, curveVertices[0].y) ' we need to duplicate 0 for the curve to start at point 0
				Else If i = nCurveVertexes-1 Then
					ofCurveVertex(curveVertices[i].x, curveVertices[i].y)
					ofCurveVertex(curveVertices[0].x, curveVertices[0].y)	' to draw a curve from pt 6 to pt 0
					ofCurveVertex(curveVertices[0].x, curveVertices[0].y)	' we duplicate the first point twice
				Else
					ofCurveVertex(curveVertices[i].x, curveVertices[i].y)
				End If
			Next
			
		ofEndShape()
		
		
		' show a faint the non-curve version of the same polygon:
		ofEnableAlphaBlending()
			ofNoFill()
			ofSetColor(0,0,0,40)
			ofBeginShape()
				For Local i:Int = 0 Until nCurveVertexes
					ofVertex(curveVertices[i].x, curveVertices[i].y)
				Next
			ofEndShape(True)
			
			
			ofSetColor(0,0,0,80)
			For Local i:Int = 0 Until nCurveVertexes
				If curveVertices[i].bOver Then
					ofFill()
				Else
					ofNoFill()
				End If
				ofCircle(curveVertices[i].x, curveVertices[i].y,4)
			Next
		ofDisableAlphaBlending()
		'-------------------------------------
		
		
		'------(g)--------------------------------------
		' 
		' 		ofBezierVertex
		' 
		' 		with ofBezierVertex we can draw a curve from the current vertex
		'		through the the next three vertexes we pass in.
		'		(two control points and the final bezier point)
		'		
		Local x0:Float = 500
		Local y0:Float = 300
		Local x1:Float = 550 + 50*Cos(ofGetElapsedTimef()*1.0 * RAD_TO_DEG)
		Local y1:Float = 300 + 100*Sin(ofGetElapsedTimef()/3.5 * RAD_TO_DEG)
		Local x2:Float = 600 + 30*Cos(ofGetElapsedTimef()*2.0 * RAD_TO_DEG)
		Local y2:Float = 300 + 100*Sin(ofGetElapsedTimef() * RAD_TO_DEG)
		Local x3:Float = 650
		Local y3:Float = 300
		
		
		
		ofFill()
		ofSetColorHex($FF9933)
		ofBeginShape()
		ofVertex(x0,y0)
		ofBezierVertex(x1,y1,x2,y2,x3,y3)
		ofEndShape()
		
		
		ofEnableAlphaBlending()
			ofFill()
			ofSetColor(0,0,0,40)
			ofCircle(x0,y0,4)
			ofCircle(x1,y1,4)
			ofCircle(x2,y2,4)
			ofCircle(x3,y3,4)
		ofDisableAlphaBlending()
		
		
		
		'------(h)--------------------------------------
		' 
		' 		holes / ofNextContour
		' 
		' 		with ofNextContour we can create multi-contour shapes
		' 		this allows us to draw holes, for example... 
		'
		ofFill()
		ofSetColorHex($d3ffd3)
		ofRect(80,480,140,70)
		ofSetColorHex($ff00ff)
		
		ofBeginShape()
			
			ofVertex(100,500)
			ofVertex(180,550)
			ofVertex(100,600)
			
			ofNextContour(True)
			
			ofVertex(120,520)
			ofVertex(160,550)
			ofVertex(120,580)
			
		ofEndShape(True)
		'-------------------------------------
		
		
		'------(i)--------------------------------------
		' 
		' 		CSG / ofNextContour
		' 
		' 		with different winding rules, you can even use ofNextContour to 
		' 		perform constructive solid geometry 
		' 		
		' 		be careful, the clockwiseness or counter clockwisenss of your multiple
		' 		contours matters with these winding rules.
		'
		' 		for csg ideas, see : http:'glprogramming.com/red/chapter11.html
		' 
		' 		info about the winding rules is here:
		'		http:'glprogramming.com/red/images/Image128.gif
		' 
		ofNoFill()
		
		
		glPushMatrix()
		
		ofSetPolyMode(OF_POLY_WINDING_ODD)
		
		ofBeginShape()
			
			ofVertex(300,500)
			ofVertex(380,550)
			ofVertex(300,600)
			
			ofNextContour(True)
			
			For Local i:Int = 0 Until 20
				Local anglef:Float = i * 18'(i / 19.0) * TWO_PI
				Local x:Float = 340 + 30 * Cos(anglef)
				Local y:Float = 550 + 30 * Sin(anglef) 
				ofVertex(x,y)
				radius :+ radiusAdder 
			Next
			
		
		ofEndShape(True)
		
		glTranslatef(100,0,0)
		
		ofSetPolyMode(OF_POLY_WINDING_NONZERO)	
		ofBeginShape()
			
			ofVertex(300,500)
			ofVertex(380,550)
			ofVertex(300,600)
			
			ofNextContour(True)
			
			For Local i:Int = 0 Until 20
				Local anglef:Float = i * 18'((i / 19.0) * TWO_PI) * 57.2957795
				Local x:Float = 340 + 30 * Cos(anglef)
				Local y:Float = 550 + 30 * Sin(anglef) 
				ofVertex(x,y)
				radius :+ radiusAdder 
			Next
			
		ofEndShape(True)
		
		glTranslatef(100,0,0)
		ofSetPolyMode(OF_POLY_WINDING_ABS_GEQ_TWO)
		ofBeginShape()
			ofVertex(300,500)
			ofVertex(380,550)
			ofVertex(300,600)
			ofNextContour(True)
			
			For Local i:Int = 0 Until 20
				Local anglef:Float = i * 18'(i / 19.0) * TWO_PI
				Local x:Float = 340 + 30 * Cos(anglef)
				Local y:Float = 550 + 30 * Sin(anglef) 
				ofVertex(x,y)
				radius :+ radiusAdder 
			Next
			
			
		ofEndShape(True)
		
		glPopMatrix()
		'-------------------------------------
		
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(a) star~nwinding rule odd", 20,210)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(b) star~nwinding rule nonzero", 220,210)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(c) dynamically~ncreated shape", 420,210)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(d) random points~npoly", 670,210)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(e) fun with sin/cos", 20,410)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(f) ofCurveVertex~nuses catmull rom~nto make curved shapes", 220,410)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(g) ofBezierVertex~nuses bezier to draw curves", 460,410)
		
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(h) ofNextContour~nallows for holes", 20,610)
		
		ofSetColorHex($000000)
		ofDrawBitmapString("(i) ofNextContour~ncan even be used for CSG operations~nsuch as union and intersection", 260,620)
		
	End Method

	Method keyPressed(key:Int)
	End Method
	
	Method keyReleased(key:Int)
	End Method

	Method mouseMoved(x:Int, y:Int)
		For Local i:Int = 0 Until nCurveVertexes
			Local diffx:Float = x - curveVertices[i].x
			Local diffy:Float = y - curveVertices[i].y
			Local dist:Float = Sqr(diffx*diffx + diffy*diffy)
			If dist < curveVertices[i].radius Then
				curveVertices[i].bOver = True
			Else
				curveVertices[i].bOver = False
			End If
		Next
	End Method

	Method mouseDragged(x:Int, y:Int, button:Int)
		For Local i:Int = 0 Until nCurveVertexes
			If curveVertices[i].bBeingDragged Then
				curveVertices[i].x = x
				curveVertices[i].y = y
			End If
		Next
	End Method

	Method mousePressed(x:Int, y:Int, button:Int)
		For Local i:Int = 0 Until nCurveVertexes
			Local diffx:Float = x - curveVertices[i].x
			Local diffy:Float = y - curveVertices[i].y
			Local dist:Float = Sqr(diffx*diffx + diffy*diffy)
			If dist < curveVertices[i].radius Then
				curveVertices[i].bBeingDragged = True
			Else
				curveVertices[i].bBeingDragged = False
			End If
		Next
	End Method

	Method mouseReleased(x:Int, y:Int, button:Int)
		For Local i:Int = 0 Until nCurveVertexes
			curveVertices[i].bBeingDragged = False
		Next
	End Method

End Type



Type draggableVertex

	Field x:Float
	Field y:Float
	Field bBeingDragged:Int
	Field bOver:Int
	Field radius:Float

End Type

