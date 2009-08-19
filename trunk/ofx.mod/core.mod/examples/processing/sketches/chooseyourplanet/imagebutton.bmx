SuperStrict

Import ofx.ofxglmax2d
Import BRL.Reflection

Type ImageButton

	Field img:ofImage
	Field imgHover:ofImage
	Field top:Int, Left:Int, w:Int, h:Int
	Field hover:Int
	
	Field _action:Object
	Field _method:TMethod
	
	Method Create:ImageButton(imgUrl:String, imgHoverUrl:String, x:Int, y:Int)
		img = New ofImage
		img.LoadImage(imgUrl)
		w = img.getWidth()
		h = img.getHeight()
		If imgHoverUrl Then
			imgHover = New ofImage
			imgHover.LoadImage(imgHoverUrl)
		End If
		top = y
		Left = x
		
		Return Self
	End Method
	
	Method setAction(action:String, instance:Object)
		_method = TTypeId.ForObject(instance).FindMethod(action)
		_action = instance
	End Method
	
	Method manage()
		If isUnderMouse() Then
			hover = True
		Else
			hover = False
		End If
	End Method
	
	Method display()
		If hover Then
			If imgHover Then
				imgHover.draw(Left, top)
			Else
				ofSetColor(0, 200, 150)
				img.draw(Left, top)
			End If
		Else
			ofSetColor(255, 255, 255)
			img.draw(Left, top)
		End If
	End Method
	
	Method isUnderMouse:Int()
		If MouseX() < Left Or MouseX() > Left+w Then
			Return False
		End If

		If MouseY() < top Or MouseY() > top + h Then
			Return False
		End If

		Return True
	End Method
	
	Method testIfClicked()
		If isUnderMouse() Then
			action()
		End If
	End Method
	
	Method action()
		_method.invoke(_action, Null)
	End Method

End Type

