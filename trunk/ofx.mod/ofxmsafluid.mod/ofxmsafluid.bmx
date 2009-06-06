SuperStrict

Rem
bbdoc: ofxMSAFluid
End Rem
Module ofx.ofxmsafluid

ModuleInfo "Version: 1.00"
ModuleInfo "License: BSD"
ModuleInfo "Copyright: Wrapper - 2009 Bruce A Henderson"

ModuleInfo "History: 1.00"
ModuleInfo "History: Initial Release."

ModuleInfo "CC_OPTS: -fexceptions"

Import "common.bmx"

Rem
bbdoc: 
End Rem
Type ofxMSAFluidSolver

	Field solverPtr:Byte Ptr

	Method New()
		solverPtr = bmx_ofx_ofxmsafluidsolver_new()
	End Method
	
	Method setup:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
		bmx_ofx_ofxmsafluidsolver_setup(solverPtr, nx, ny)
		Return Self
	End Method
	
	Method setSize:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
		bmx_ofx_ofxmsafluidsolver_setsize(solverPtr, nx, ny)
		Return Self
	End Method
	
	Method update()
		bmx_ofx_ofxmsafluidsolver_update(solverPtr)
	End Method
	
	Method reset()
		bmx_ofx_ofxmsafluidsolver_reset(solverPtr)
	End Method
	
	Method getIndexForCellPosition:Int(x:Int, y:Int)
		Return bmx_ofx_ofxmsafluidsolver_getindexforcellposition(solverPtr, x, y)
	End Method
	
	Method getIndexForNormalizedPosition:Int(x:Float, y:Float)
		Return bmx_ofx_ofxmsafluidsolver_getindexfornormalizedposition(solverPtr, x, y)
	End Method
	
	Method randomizeColor()
	End Method
	
	Method getNumCells:Int()
	End Method
	
	Method getWidth:Int()
	End Method
	
	Method getHeight:Int()
	End Method
	
	Method setVisc:ofxMSAFluidSolver(newVisc:Float)
		bmx_ofx_ofxmsafluidsolver_setvisc(solverPtr, newVisc)
		Return Self
	End Method
	
	Method getVisc:Float()
	End Method

	Method setColorDiffusion(diff:Float)
	End Method
	
	Method getColorDiffusion:Float()
	End Method
	
	Method enableRGB:ofxMSAFluidSolver(isRGB:Int)
		bmx_ofx_ofxmsafluidsolver_enablergb(solverPtr, isRGB)
		Return Self
	End Method
	
	Method setDeltaT:ofxMSAFluidSolver(dt:Float = FLUID_DEFAULT_DT)
		bmx_ofx_ofxmsafluidsolver_setdeltat(solverPtr, dt)
		Return Self
	End Method
	
	Method setFadeSpeed:ofxMSAFluidSolver(fadeSpeed:Float = FLUID_DEFAULT_FADESPEED)
		bmx_ofx_ofxmsafluidsolver_setfadespeed(solverPtr, fadeSpeed)
		Return Self
	End Method
	
	Method setSolverIterations:ofxMSAFluidSolver(solverIterations:Int = FLUID_DEFAULT_SOLVER_ITERATIONS)
		bmx_ofx_ofxmsafluidsolver_setsolveriterations(solverPtr, solverIterations)
		Return Self
	End Method
	
	Method enableVorticityConfinement:ofxMSAFluidSolver(value:Int)
		bmx_ofx_ofxmsafluidsolver_enablevorticityconfinement(solverPtr, value)
		Return Self
	End Method
	
	Method getVorticityConfinement:Int()
	End Method
	
	Method setWrap:ofxMSAFluidSolver(bx:Int, by:Int )
		bmx_ofx_ofxmsafluidsolver_setwrap(solverPtr, bx, by)
		Return Self
	End Method
	
	Method getAvgDensity:Float()
	End Method
	
	Method getUniformity:Float()
	End Method
	
	Method getAvgSpeed:Float()
	End Method
	
	Method r:Float Ptr()
		Return bmx_ofx_ofxmsafluidsolver_r(solverPtr)
	End Method
	
	Method g:Float Ptr()
		Return bmx_ofx_ofxmsafluidsolver_g(solverPtr)
	End Method
	
	Method b:Float Ptr()
		Return bmx_ofx_ofxmsafluidsolver_b(solverPtr)
	End Method
	
	Method u:Float Ptr()
		Return bmx_ofx_ofxmsafluidsolver_u(solverPtr)
	End Method
	
	Method v:Float Ptr()
		Return bmx_ofx_ofxmsafluidsolver_v(solverPtr)
	End Method
	
	Method Free()
		If solverPtr Then
			bmx_ofx_ofxmsafluidsolver_free(solverPtr)
			solverPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type ofxMSAFluidDrawer

	Field drawPtr:Byte Ptr

	Method New()
		drawPtr = bmx_ofx_ofxmsafluiddrawer_new()
	End Method

	Method setupXY:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
	End Method
	
	Method setup:ofxMSAFluidSolver(solver:ofxMSAFluidSolver)
		bmx_ofx_ofxmsafluiddrawer_setup(drawPtr, solver.solverPtr)
		Return solver
	End Method
	
	Method getFluidSolver:ofxMSAFluidSolver()
	End Method
	
	Method update()
	End Method
	
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0)
		bmx_ofx_ofxmsafluiddrawer_draw(drawPtr, x, y, w, h)
	End Method
	
	Method drawMotion(x:Float, y:Float, w:Float, h:Float, withAlpha:Int = False)
	End Method
	
	Method drawSpeed(x:Float, y:Float, w:Float, h:Float, withAlpha:Int = False)
	End Method
	
	Method drawVectors(x:Float, y:Float, w:Float, h:Float)
	End Method
	
	Method reset()
	End Method
	
	Method getWidth:Float()
	End Method
	
	Method getHeight:Float()
	End Method

	Method Free()
		If drawPtr Then
			bmx_ofx_ofxmsafluiddrawer_free(drawPtr)
			drawPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

End Type


Type ofxParticleSystem

	Field systemPtr:Byte Ptr

	Method New()
		systemPtr = bmx_ofx_ofxparticlesystem_new()
	End Method
	
	Method init(solver:ofxMSAFluidSolver, width:Int, height:Int)
		bmx_ofx_ofxparticlesystem_init(systemPtr, solver.solverPtr, width, height)
	End Method
	
	Method updateAndDraw(renderUsingVA:Int)
		bmx_ofx_ofxparticlesystem_updateanddraw(systemPtr, renderUsingVA)
	End Method

	Method addParticles(x:Float, y:Float, count:Int)
		bmx_ofx_ofxparticlesystem_addparticles(systemPtr, x, y, count)
	End Method

	Method Free()
		If systemPtr Then
			bmx_ofx_ofxparticlesystem_free(systemPtr)
			systemPtr = Null
		End If
	End Method
	
	Method Delete()
		Free()
	End Method

End Type


