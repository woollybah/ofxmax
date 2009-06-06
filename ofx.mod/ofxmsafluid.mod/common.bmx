SuperStrict

Import "source.bmx"

Extern

	Function bmx_ofx_ofxmsafluidsolver_new:Byte Ptr()
	Function bmx_ofx_ofxmsafluidsolver_setup(handle:Byte Ptr, nx:Int, ny:Int)
	Function bmx_ofx_ofxmsafluidsolver_setsize(handle:Byte Ptr, nx:Int, ny:Int)
	Function bmx_ofx_ofxmsafluidsolver_setvisc(handle:Byte Ptr, newVisc:Float)
	Function bmx_ofx_ofxmsafluidsolver_enablergb(handle:Byte Ptr, isRGB:Int)
	Function bmx_ofx_ofxmsafluidsolver_setdeltat(handle:Byte Ptr, dt:Float)
	Function bmx_ofx_ofxmsafluidsolver_setfadespeed(handle:Byte Ptr, fadeSpeed:Float)
	Function bmx_ofx_ofxmsafluidsolver_setsolveriterations(handle:Byte Ptr, solverIterations:Int)
	Function bmx_ofx_ofxmsafluidsolver_enablevorticityconfinement(handle:Byte Ptr, value:Int)
	Function bmx_ofx_ofxmsafluidsolver_setwrap(handle:Byte Ptr, bx:Int, by:Int)
	Function bmx_ofx_ofxmsafluidsolver_r:Float Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_g:Float Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_b:Float Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_u:Float Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_v:Float Ptr(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_update(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_reset(handle:Byte Ptr)
	Function bmx_ofx_ofxmsafluidsolver_getindexforcellposition:Int(handle:Byte Ptr, x:Int, y:Int)
	Function bmx_ofx_ofxmsafluidsolver_getindexfornormalizedposition:Int(handle:Byte Ptr, x:Float, y:Float)
	Function bmx_ofx_ofxmsafluidsolver_free(handle:Byte Ptr)

	Function bmx_ofx_ofxparticlesystem_new:Byte Ptr()
	Function bmx_ofx_ofxparticlesystem_init(handle:Byte Ptr, solver:Byte Ptr, width:Int, height:Int)
	Function bmx_ofx_ofxparticlesystem_updateanddraw(handle:Byte Ptr, renderUsingVA:Int)
	Function bmx_ofx_ofxparticlesystem_addparticles(handle:Byte Ptr, x:Float, y:Float, count:Int)
	Function bmx_ofx_ofxparticlesystem_free(handle:Byte Ptr)

	Function bmx_ofx_ofxmsafluiddrawer_new:Byte Ptr()
	Function bmx_ofx_ofxmsafluiddrawer_setup(handle:Byte Ptr, solver:Byte Ptr)
	Function bmx_ofx_ofxmsafluiddrawer_draw(handle:Byte Ptr, x:Int, y:Int, w:Int, h:Int)
	Function bmx_ofx_ofxmsafluiddrawer_free(handle:Byte Ptr)


End Extern


Const FLUID_DEFAULT_NX:Int = 100
Const FLUID_DEFAULT_NY:Int = 100
Const FLUID_DEFAULT_DT:Float = 0.04	' Maa	25fps
Const FLUID_DEFAULT_VISC:Float = 0.0001
Const FLUID_DEFAULT_COLOR_DIFFUSION:Int = 0
Const FLUID_DEFAULT_FADESPEED:Float = .03
Const FLUID_DEFAULT_SOLVER_ITERATIONS:Int = 10

Const FLUID_DRAW_COLOR:Int = 0
Const FLUID_DRAW_MOTION:Int = 1
Const FLUID_DRAW_SPEED:Int = 2
Const FLUID_DRAW_VECTORS:Int = 3
Const FLUID_DRAW_MODE_COUNT:Int = 4

