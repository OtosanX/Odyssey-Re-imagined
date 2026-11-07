Function Main(Killer as Long, Killed as Long) AS LONG
dim Loop as Long, Count1 as Long, Count2 as Long

RunScript1("GameWarp", Killed)
RunScript1("Restore", Killed)
SetPlayerFlag(Killed, 10, 0)
SetPlayerFlag(Killed, 11, 0)
SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
RunScript1("Sprite", Killed)

For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerFlag(Loop, 10) = 2 Then
			If GetPlayerFlag(Loop, 11) = 1 Then Count1 = Count1 + 1
			If GetPlayerFlag(Loop, 11) = 2 Then Count2 = Count2 + 1
		End If
	End If
Next Loop

If Count1 = 0 Then
	GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " and won Team Carnage!")), BrightGreen)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 2 Then
			If GetPlayerFlag(Loop, 11) = 2 Then
				RunScript1("GameWarp", Loop)
				RunScript1("Restore", Loop)
				GiveObj(Loop, 484, 1)
				SetPlayerFlag(Loop, 10, 0)
				SetPlayerFlag(Loop, 11, 0)
				SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
				RunScript1("Sprite", Loop)
			End If
		End If
	Next Loop
Else
	If Count2 = 0 Then
		GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " and won Team Carnage!")), BrightGreen)
		For Loop = 1 To GetMaxUsers()
			If GetPlayerFlag(Loop, 10) = 2 Then
				If GetPlayerFlag(Loop, 11) = 1 Then
					RunScript1("GameWarp", Loop)
					RunScript1("Restore", Loop)
					GiveObj(Loop, 483, 1)
					SetPlayerFlag(Loop, 10, 0)
					SetPlayerFlag(Loop, 11, 0)
					SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
					RunScript1("Sprite", Loop)
				End If
			End If
		Next Loop
	Else
		If GetPlayerFlag(Killer, 11) = 1 Then
			GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " in Team Carnage!")), BrightRed)
		Else
			GlobalMessage(strcat(strcat(GetPlayerName(Killer), " has slain "), strcat(GetPlayerName(Killed), " in Team Carnage!")), BrightBlue)
		End If
	End If
End If

End Function