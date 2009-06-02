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

	Method New()
	End Method
	
	Method setup:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
	End Method
	
	Method setSize:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
	End Method
	
	Method update()
	End Method
	
	Method reset()
	End Method
	
	Method getIndexForCellPosition:Int(x:Int, y:Int)
	End Method
	
	Method getIndexForNormalizedPosition:Int(x:Int, y:Int)
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
	End Method
	
	Method getVisc:Float()
	End Method

	Method setColorDiffusion(diff:Float)
	End Method
	
	Method getColorDiffusion:Float()
	End Method
	
	Method enableRGB:ofxMSAFluidSolver(isRGB:Int)
	End Method
	
	Method setDeltaT:ofxMSAFluidSolver(dt:Float = FLUID_DEFAULT_DT)
	End Method
	
	Method setFadeSpeed:ofxMSAFluidSolver(fadeSpeed:Float = FLUID_DEFAULT_FADESPEED)
	End Method
	
	Method setSolverIterations:ofxMSAFluidSolver(solverIterations:Int = FLUID_DEFAULT_SOLVER_ITERATIONS)
	End Method
	
	Method enableVorticityConfinement:ofxMSAFluidSolver(b:Int)
	End Method
	
	Method getVorticityConfinement:Int()
	End Method
	
	Method setWrap:ofxMSAFluidSolver(bx:Int, by:Int )
	End Method
	
	Method getAvgDensity:Float()
	End Method
	
	Method getUniformity:Float()
	End Method
	
	Method getAvgSpeed:Float()
	End Method
	
	Method r:Float Ptr()
	End Method
	
	Method g:Float Ptr()
	End Method
	
	Method b:Float Ptr()
	End Method
	
	Method u:Float Ptr()
	End Method
	
	Method v:Float Ptr()
	End Method
	
End Type

Rem
bbdoc: 
End Rem
Type ofxMSAFluidDrawer

	Field drawPtr:Byte Ptr

	Method New()
	End Method

	Method setupXY:ofxMSAFluidSolver(nx:Int = FLUID_DEFAULT_NX, ny:Int = FLUID_DEFAULT_NY)
	End Method
	
	Method setup:ofxMSAFluidSolver(solver:ofxMSAFluidSolver)
	End Method
	
	Method getFluidSolver:ofxMSAFluidSolver()
	End Method
	
	Method update()
	End Method
	
	Method draw(x:Float, y:Float, w:Float = 0, h:Float = 0)
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

End Type



