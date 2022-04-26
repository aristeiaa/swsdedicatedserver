#MaxThreadsPerHotkey 4
CoordMode, ToolTip, Screen


*F4::
Toggle := !Toggle
Toggle2 := !Toggle2
Toggle3 := !Toggle3
Toggle4 := !Toggle4
Toggle5 := !Toggle5
reload
return


*F1::
Toggle1 := !Toggle1
loop 1
{
	If (not Toggle1) {
        break
	}

	; homing protocol
	loop 5
	{
		Send {a down}
		Send {a up}
		Sleep 50
	}	
	Sleep 300

	; go right one to multiplayer
	Send {d down}
	Send {d up}
	Sleep 300
	
	; confirm multiplayer
	Send {space down}
	Send {space up}
	Sleep 300

	; create custom
	loop 3
	{
		Send {s down}
		Send {s up}
		Sleep 100
	}
	Sleep 300
	Send {space down}
	Send {space up}
	Sleep 300

	; load settings
	Send {space down}
	Send {space up}
	Sleep 300

	; first profile
	Send {space down}
	Send {space up}
	Sleep 300	

	; confirm load slot
	Send {space down}
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
	Send {space up}
	Sleep 400	

	; confirm create match as spectator
	Send {space down}
	Send {space up}
	Sleep 300

	; wait for the game to load
	Sleep 10000

	; do mouse move
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