SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d
Import ofx.ofxmsafluid


Const FLUID_WIDTH:Int = 150

'
Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 800, 600, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field fluidSolver:ofxMSAFluidSolver
	Field fluidDrawer:ofxMSAFluidDrawer
	
	'Field particleSystem:ParticleSystem
	
	Field drawFluid:Int
	Field drawParticles:Int
	Field renderUsingVA:Int
	
	Field pmouseX:Int, pmouseY:Int
	
	Field width:Int, height:Int

	Method setup()
	
		fluidSolver = New ofxMSAFluidSolver
		fluidDrawer = New ofxMSAFluidDrawer
		
	
		fluidSolver.setup(FLUID_WIDTH, FLUID_WIDTH / 1)
		fluidSolver.enableRGB(True).setFadeSpeed(0.002).setDeltaT(0.5).setVisc(0.00015).setColorDiffusion(0)
		
		fluidDrawer.setup(fluidSolver)

		drawFluid = True
		drawParticles = True
		renderUsingVA = True
	
		ofBackground(0, 0, 0)
		ofSetVerticalSync(True)
		ofSetFrameRate(60)
	End Method
	
	Method update()
	
		fluidSolver.update()
		
		' save old mouse position (openFrameworks doesn't do this automatically like processing does)
		'pmouseX = _MouseX
		'pmouseY = _MouseY
	End Method
	
	Method draw()
		ofSetBackgroundAuto(drawFluid)
		
		If drawFluid Then
			SetColor 255, 255, 255
			fluidDrawer.draw(0, 0, width, height)
		End If
		
		If drawParticles Then
			'particleSystem.updateAndDraw()
		End If
		
	End Method

End Type
