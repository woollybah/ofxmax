' Choose Your Planet
' By antiplastik        http://www.openprocessing.org/visuals/?visualID=3672
'
' Ported to ofxMax by Bruce A Henderson
'
'
SuperStrict

Framework ofx.ofxglmax2d
Import brl.glmax2d
Import bah.random

Import "planet.bmx"
Import "imagebutton.bmx"
Import "eolienne.bmx"
Import "building.bmx"
Import "tree.bmx"

SeedRnd(MilliSecs())
AppTitle = "Choose Your Planet"

Local window:GLMax2DWindow = New GLMax2DWindow
ofSetupOpenGL(window, 400, 300, OF_WINDOW)

ofRunApp(New TTestApp)


Type TTestApp Extends ofBaseApp

	Field _planet:Planet
	Field buttons:ImageButton[]

	Method setup()
		ofBackground(255,255,255)
		ofSetFrameRate(20)
		ofEnableSmoothing()
		
		_planet = New Planet.Create(150, 150)
		
		
		buttons = New ImageButton[4]
		
		buttons[0] = New ImageButton.Create("data/btnEolienne.png", Null, 325, 20)
		buttons[0].setAction("e_action", Self)
		buttons[1] = New ImageButton.Create("data/btnBuilding.png", Null, 325, 80)
		buttons[1].setAction("b_action", Self)
		buttons[2] = New ImageButton.Create("data/btnTree.png", Null, 325, 140)
		buttons[2].setAction("t_action", Self)
		buttons[3] = New ImageButton.Create("data/btnReset.png", Null, 325, 230)
		buttons[3].setAction("r_action", Self)
		
	End Method

	Method update()
		_planet.turn()

		If KeyHit(key_escape) Then
			End
		End If
	End Method
	
	Method draw()
		Local isOverButton:Int = False
		
		For Local i:Int = 0 Until buttons.length
			buttons[i].manage()
			isOverButton = isOverButton Or buttons[i].hover
		Next
		If isOverButton Then
			' TODO cursor stuff
		End If
		
		_planet.display()
		
		For Local i:Int = 0 Until buttons.length
			buttons[i].display()
		Next
	End Method
	
	Method mousePressed(x:Int, y:Int, button:Int)
		For Local i:Int = 0 Until buttons.length
			buttons[i].testIfClicked()
		Next
	End Method
	
	Method e_action()
		_planet.addObject(New Eolienne.Create(_planet, Rand(0, 360) - _planet.a))
	End Method
	
	Method b_action()
		_planet.addObject(New Building.Create(_planet, Rand(0, 360) - _planet.a))
	End Method

	Method t_action()
		_planet.addObject(New Tree.Create(_planet, Rand(0, 360) - _planet.a))
	End Method

	Method r_action()
		_planet.clean()
	End Method

End Type



