#MaxThreadsPerHotkey 4
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen

; Configuration Variables
GamePath = N:\SteamLibrary\steamapps\common\STAR WARS Squadrons\starwarssquadrons_launcher.exe

; F4 reloads the script and resets loops
*F4::
Toggle := !Toggle
Toggle2 := !Toggle2
Toggle3 := !Toggle3
Toggle4 := !Toggle4
Toggle5 := !Toggle5
reload
return

; Helpers

; Lets us draw boxes on the screen
CreateBox(Color)
{
	Gui 81:color, %Color%
	Gui 81:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 82:color, %Color%
	Gui 82:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 83:color, %Color%
	Gui 83:+ToolWindow -SysMenu -Caption +AlwaysOnTop
	Gui 84:color, %Color%
	Gui 84:+ToolWindow -SysMenu -Caption +AlwaysOnTop
}

Box(XCor, YCor, Width, Height, Thickness, Offset)
{
	If InStr(Offset, "In")
	{
		StringTrimLeft, offset, offset, 2
		If not Offset
			Offset = 0
		Side = -1
	} Else {
		StringTrimLeft, offset, offset, 3
		If not Offset
			Offset = 0
		Side = 1
	}
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y := YCor - (Side + 1) / 2 * Thickness - Side * Offset
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 81:Show, x%x% y%y% w%w% h%h% NA
	x += Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 82:Show, x%x% y%y% w%w% h%h% NA
	x := x + w - Thickness
	y += Thickness
	h := Height + Side * Thickness + Side * Offset * 2
	w := Thickness
	Gui 83:Show, x%x% y%y% w%w% h%h% NA
	x := XCor - (Side + 1) / 2 * Thickness - Side * Offset
	y += h - Thickness
	w := Width + Side * Thickness + Side * Offset * 2
	h := Thickness
	Gui 84:Show, x%x% y%y% w%w% h%h% NA
}

RemoveBox()
{
	Gui 81:destroy
	Gui 82:destroy
	Gui 83:destroy
	Gui 84:destroy
}

; Box_Hide - Hides the GUI.
Box_Hide() {
	Gui 81:Hide
	Gui 82:Hide
	Gui 83:Hide
	Gui 84:Hide
}

*F5::
PixelSearch, Px, Py, 0, 0, 300, 300, 0xffffff, 3, Fast
if ErrorLevel
    MsgBox, That color was not found in the specified region.
else
    MsgBox, A color within 3 shades of variation was found at X%Px% Y%Py%.

return

; Functions

; Wait for confirm box to appear
waitForConfirm(waitTime=100) {
	loop {
		Sleep 500
		CoordMode, Pixel, Screen
		CoordMode, Mouse, Screen
		PixelSearch, Px, Py, 1130, 968, 1130, 968, 0xD9D9D9, 0, Fast
		If (ErrorLevel = 0) {
			; MsgBox, A color within 3 shades of variation was found at X%Px% Y%Py%.
			CreateBox("FF0000")
			Box(Px - 2, Py - 2, 4, 4, 2, "in")
			Sleep %waitTime%
			Box_Hide()
			return True
		}
	}
}


*F6:: 
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position (%MouseX%,%MouseY%) is %color%.
return

*F7::
waitForConfirm(2000)
return

; F1 starts the script running once loaded
*F1::
Toggle1 := !Toggle1
loop 1
{
	; Start the game
	;Run %GamePath%

	; Wait 2m for game to start
	;Sleep 120000

	If (not Toggle1) {
        break
	}

	; do mouse move
	MouseClick, right
	MouseMove, 0, 0
	Sleep 1000

	; tab in and out from friends
	Send {Tab down}
	Sleep 50
	Send {Tab up}
	Sleep 200
	Send {Tab down}
	Sleep 50
	Send {Tab up}
	Sleep 200

	; homing protocol
	loop 5
	{
		Send {a down}
		Send {a up}
		Sleep 100
	}	
	Sleep 300

	; go right one to multiplayer
	Send {d down}
	Send {d up}
	Sleep 300
	
	; select multiplayer
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 300

	; move down to select custom
	loop 3
	{
		Send {s down}
		Send {s up}
		Sleep 100
	}
	Sleep 300

	; select custom
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 300

	; load settings
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 500

	; first profile
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 500
	waitForConfirm()

	; confirm load slot
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 300

	; create match as spectator
	loop 6
	{
		Send {s down}
		Send {s up}
		Sleep 100
	}
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 100
	waitForConfirm()

	; confirm create match as spectator
	Send {space down}
	Sleep 50
	Send {space up}
	Sleep 300

	; wait for the game to load
	Sleep 10000

	; do mouse move
	MouseClick, right
	MouseMove, 0, 0
	Sleep 2000

	; start game loop
	loop
	{
		MouseMove, 0, 0
		Send {b down}
		Send {b up}
		Sleep 200
		Send {space down}
		Send {space up}
		Sleep 200
		loop 2
		{
			Send {escape down}
			Send {escape up}
			Sleep 200
		}
		
		Sleep 5000
	}	
}
Toggle1 := !Toggle1
return