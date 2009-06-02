SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d
Import ofx.ofxMSAFluid
Import ofx.ofxMSAUtils
Import brl.random

Const FLUID_WIDTH:Int = 150

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 800, 600, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field fluidSolver:ofxMSAFluidSolver
	Field fluidDrawer:ofxMSAFluidDrawer
	
	Field particleSystem:ofxParticleSystem
	
	Field drawFluid:Int
	Field drawParticles:Int
	Field renderUsingVA:Int
	
	Field pmouseX:Int, pmouseY:Int
	
	Field width:Int, height:Int
	Field invWidth:Float, invHeight:Float
	Field aspectRatio:Float
	Field aspectRatio2:Float

	Method setup()
		width = GraphicsWidth()
		height = GraphicsHeight()
		invWidth = 1.0 / width
		invHeight = 1.0 / height
		
		aspectRatio = width * invHeight
		aspectRatio2 = aspectRatio * aspectRatio
	
		fluidSolver = New ofxMSAFluidSolver
		fluidDrawer = New ofxMSAFluidDrawer
		
		particleSystem = New ofxParticleSystem
		particleSystem.init(fluidSolver, width, height)
		
	
		fluidSolver.setup(FLUID_WIDTH, FLUID_WIDTH / aspectRatio)
		fluidSolver.enableRGB(True).setFadeSpeed(0.002).setDeltaT(0.5).setVisc(0.00015).setColorDiffusion(0)
		
		fluidDrawer.setup(fluidSolver)

		drawFluid = True
		drawParticles = True
		renderUsingVA = True
	
		ofBackground(0, 0, 0)
		ofSetVerticalSync(True)
		ofSetFrameRate(60)
		
		pmouseX = MouseX()
		pmouseY = MouseY()
	End Method
	
	Method update()
	
		fluidSolver.update()
		
		Local x:Int = MouseX()
		Local y:Int = MouseY()
		
		If pmousex <> x Or pmousey <> y Then
		' save old mouse position (openFrameworks doesn't do this automatically like processing does)
		
'		If KeyHit(key_space) Then
'			addToFluid(MouseX() * invWidth, MouseY() * invHeight, Rand(0, 5), 1, True)
'		End If

	Local mouseNormX:Float = x * invWidth
    Local mouseNormY:Float = y * invHeight
    Local mouseVelX:Float = (x - pmouseX) * invWidth
    Local mouseVelY:Float = (y - pmouseY) * invHeight
	
	addToFluid(mouseNormX, mouseNormY, mouseVelX, mouseVelY, Not MouseDown(1))
	
	End If


		pmouseX = x
		pmouseY = y
		
		If KeyHit(key_escape) Then
			End
		End If

	End Method
	
	Method draw()
		ofSetBackgroundAuto(drawFluid)
		
		If drawFluid Then
			SetColor 255, 255, 255
			fluidDrawer.draw(0, 0, width, height)
		End If
		
		If drawParticles Then
			particleSystem.updateAndDraw(renderUsingVA)
		End If
		
	End Method

	' add force And dye To fluid, And Create particles
	Method addToFluid(x:Float, y:Float, dx:Float, dy:Float, addColor:Int, addForce:Int = True)
		Local speed:Float = dx * dx  + dy * dy * aspectRatio2    ' balance the x And y components of speed with the screen aspect ratio

		If speed > 0 Then
			If x < 0 Then
				x = 0
			Else If x > 1 Then
				x = 1
			End If
			
			If y < 0 Then
				y = 0
			Else If y > 1 Then
				y = 1
			End If
		
			Local colorMult:Float = 50
			Local velocityMult:Float = 30
		
			Local index:Int = fluidSolver.getIndexForNormalizedPosition(x, y)

			If addColor Then
				Local drawColor:msaColor = New msaColor
				Local hue:Int = ((x + y) * 180 + ofGetFrameNum()) Mod 360
				drawColor.setHSV(hue, 1, 1)
			
				fluidSolver.r()[index] :+ drawColor.r() * colorMult
				fluidSolver.g()[index] :+ drawColor.g() * colorMult
				fluidSolver.b()[index] :+ drawColor.b() * colorMult
			
				If drawParticles Then
					particleSystem.addParticles(x * width, y * height, 10)
				End If
			End If
			
			If addForce Then
				fluidSolver.u()[index] :+ dx * velocityMult
				fluidSolver.v()[index] :+ dy * velocityMult
			End If
			
			If Not drawFluid And ofGetFrameNum() Mod 5 = 0 Then
				'fadeToColor(0, 0, 0, 0.1)
			End If
		End If
	End Method
	
End Type
