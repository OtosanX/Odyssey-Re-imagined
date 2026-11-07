Sub Main(Killer as Long, Killed as Long)
dim Loop as Long, Count as Long
Count = 0

If GetPlayerFlag(Killed, 11) = 1 Then	'Red Team Dies
If GetPlayerFlag(Killer, 11) = 1 Then Exit Sub
	PlayerWarp(Killed, 82, 5, 1)
	If HasObj(Killed, 509) Then	'Has Blue Flag
		TakeObj(Killed, 509, 1)
		SpawnObject(78, 509, 1, 10, 6)
		SetFlag(182, 0)
		GlobalMessage(strcat(GetPlayerName(Killer), strcat(" has jailed ", strcat(GetPlayerName(Killed), " and returned the Blue Flag!"))), BrightBlue)
	Else
		GlobalMessage(StrCat(strcat(GetPlayerName(Killer), " has jailed "), GetPlayerName(Killed)), Red)
	End If
	SetPlayerFlag(Killed, 12, 1)
	RunScript1("Restore", Killed)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 6 Then
			If GetPlayerFlag(Loop, 11) = 1 Then
				If GetPlayerFlag(Loop, 12) = 0 Then Count = Count + 1
			End If
		End If
	Next Loop
		If Count = 0 Then
			GlobalMessage("Jailbreak!", Yellow)
			OpenDoor(82, 10, 2)
		End If
End If
If GetPlayerFlag(Killed, 11) = 2 Then	'Blue Team Dies
If GetPlayerFlag(Killer, 11) = 2 Then Exit Sub
	PlayerWarp(Killed, 84, 5, 1)
	If HasObj(Killed, 508) Then	'Has Red Flag
		TakeObj(Killed, 508, 1)
		SpawnObject(70, 508, 1, 1, 6)
		SetFlag(181, 0)
		GlobalMessage(strcat(GetPlayerName(Killer), strcat(" has jailed ", strcat(GetPlayerName(Killed), " and returned the Red Flag!"))), BrightRed)
	Else
		GlobalMessage(StrCat(strcat(GetPlayerName(Killer), " has jailed "), GetPlayerName(Killed)), Blue)
	End If
	SetPlayerFlag(Killed, 12, 1)
	RunScript1("Restore", Killed)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 6 Then
			If GetPlayerFlag(Loop, 11) = 2 Then
				If GetPlayerFlag(Loop, 12) = 0 Then Count = Count + 1
			End If
		End If
	Next Loop
		If Count = 0 Then
			GlobalMessage("Jailbreak!", Yellow)
			OpenDoor(84, 10, 2)
		End If
End If

End Sub