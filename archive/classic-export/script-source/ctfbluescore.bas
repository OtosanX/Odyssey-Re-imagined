Sub Main(Player as Long)
dim Loop as Long

SetFlag(12, GetFlag(12) + 1)
TakeObj(Player, 508, 1)
GlobalMessage(strcat(GetPlayerName(Player), " has captured the Red Flag!"), BrightBlue)
GlobalMessage(strcat("Red ", strcat(str(GetFlag(11)), strcat(" - ", strcat(str(GetFlag(12)), " Blue")))), Yellow)
If GetFlag(12) = GetFlag(10) Then
	RunScript0("CTFBlueWin")
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