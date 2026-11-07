Sub Main(Player as Long)
dim Loop as Long

PlayerWarp(Player, 78, 9, 6)

If GetPlayerFlag(Player, 11) = 2 Then	'Blue Team
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If HasObj(Loop, 509) Then
				PlayerMessage(Player, "The Blue Flag has been taken! You must return it!", White)
				Exit Sub
			End If
		End If
	Next Loop
	If HasObj(Player, 508) Then	'Has Red Flag
		RunScript1("CTFBlueScore", Player)
	Else
		PlayerMessage(Player, "This is your Flag.", White)
	End If
End If
If GetPlayerFlag(Player, 11) = 1 Then	'Red Team
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If HasObj(Loop, 509) Then
				PlayerMessage(Player, "The Blue Flag has been taken!", White)
				Exit Sub
			End If
		End If
	Next Loop
	If RunScript1("Invent", Player) = 1 Then
		PlayerMessage(Player, "Your inventory is full.", Grey)
		Exit Sub
	End If
	GlobalMessage(strcat(GetPlayerName(Player), " has picked up the Blue Flag!"), BrightRed)
	GiveObj(Player, 509, 1)
	Timer(Player, 2, "FlagTimer")
	SetFlag(182, 0)
	For Loop = 0 To 80
		If GetObjNum(78, Loop) = 509 Then DestroyObject(78, Loop)
	Next Loop
End If

End Sub