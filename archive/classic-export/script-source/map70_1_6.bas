Sub Main(Player as Long)
dim Loop as Long

PlayerWarp(Player, 70, 2, 6)

If GetPlayerFlag(Player, 11) = 1 Then	'Red Team
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If HasObj(Loop, 508) Then
				PlayerMessage(Player, "The Red Flag has been taken! You must return it!", White)
				Exit Sub
			End If
		End If
	Next Loop
	If HasObj(Player, 509) Then	'Has Blue Flag
		RunScript1("CTFRedScore", Player)
	Else
		PlayerMessage(Player, "This is your Flag.", White)
	End If
End If
If GetPlayerFlag(Player, 11) = 2 Then	'Blue Team
	For Loop = 1 To GetMaxUsers()
		If IsPlaying(Loop) Then
			If HasObj(Loop, 508) Then
				PlayerMessage(Player, "The Red Flag has been taken!", White)
				Exit Sub
			End If
		End If
	Next Loop
	If RunScript1("Invent", Player) = 1 Then
		PlayerMessage(Player, "Your inventory is full.", Grey)
		Exit Sub
	End If
	GlobalMessage(strcat(GetPlayerName(Player), " has picked up the Red Flag!"), BrightBlue)
	GiveObj(Player, 508, 1)
	SetFlag(181, 0)
	Timer(Player, 2, "FlagTimer")
	For Loop = 0 To 80
		If GetObjNum(70, Loop) = 508 Then DestroyObject(70, Loop)
	Next Loop
End If

End Sub