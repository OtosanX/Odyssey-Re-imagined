Sub Main(Player as Long)
dim Loop as Long

SetFlag(11, GetFlag(11) + 1)
TakeObj(Player, 509, 1)
GlobalMessage(strcat(GetPlayerName(Player), " has captured the Blue Flag!"), BrightRed)
GlobalMessage(strcat("Red ", strcat(str(GetFlag(11)), strcat(" - ", strcat(str(GetFlag(12)), " Blue")))), Yellow)
If GetFlag(11) = GetFlag(10) Then
	RunScript0("CTFRedWin")
	Exit Sub
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 6 Then
		If GetPlayerFlag(Loop, 12) = 0 Then
			If GetPlayerFlag(Loop, 11) = 1 Then
				PlayerWarp(Loop, 70, 1, 10)
				SetPlayerSprite(Loop, 132)
				SetPlayerGuild(Loop, 100)
			End If
			If GetPlayerFlag(Loop, 11) = 2 Then
				PlayerWarp(Loop, 78, 10, 10)
				SetPlayerSprite(Loop, 133)
				SetPlayerGuild(Loop, 101)
			End If
			RunScript1("Restore", Loop)
		End If
	End If
Next Loop

RunScript0("CTFResetFlags")

End Sub