Function Main(Killer as Long, Killed as Long) AS LONG
dim Loop as Long, Count1 as Long, Count2 as Long

Select Case GetPlayerFlag(Killed, 11)
	Case 1
		If GetPlayerFlag(Killed, 12) > 0 Then
			PlayerWarp(Killed, 1525, 5, 5)
			SetPlayerSprite(Killed, 19)
			SetPlayerGuild(Killed, 100)
			SetPlayerHP(Killed, GetPlayerMaxHP(Killed))
			SetPlayerFlag(Killed, 12, GetPlayerFlag(Killed, 12) - 1)
		Else
			PlayerWarp(Killed, 8, 7, 9)
			RunScript1("GameWarp", Killed)
			GlobalMessage(strcat(GetPlayerName(Killed), " has been knocked out of Titan Takedown!"), Blue)
			SetPlayerFlag(Killed, 10, 0)
			SetPlayerFlag(Killed, 11, 0)
			SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
			RunScript1("sprite", Killed)
		End If
	Case 2
		If GetPlayerFlag(Killed, 12) > 0 Then
			PlayerWarp(Killed, 1539, 5, 2)
			SetPlayerSprite(Killed, 93)
			SetPlayerGuild(Killed, 101)
			SetPlayerHP(Killed, GetPlayerMaxHP(Killed))
			SetPlayerFlag(Killed, 12, GetPlayerFlag(Killed, 12) - 1)
		Else
			PlayerWarp(Killed, 8, 7, 9)
			RunScript1("GameWarp", Killed)
			GlobalMessage(strcat(GetPlayerName(Killed), " has been knocked out of Titan Takedown!"), Red)
			SetPlayerFlag(Killed, 10, 0)
			SetPlayerFlag(Killed, 11, 0)
			SetPlayerGuild(Killed, GetPlayerFlag(Killed, 5))
			RunScript1("Sprite", Killed)
			CalculateStats(Killed)
		End If
End Select

Count1 = 0
Count2 = 0
For Loop = 1 To GetMaxUsers()
	If IsPlaying(Loop) Then
		If GetPlayerFlag(Loop, 10) = 4 Then
			If GetPlayerFlag(Loop, 11) = 1 Then Count1 = Count1 + 1
			If GetPlayerFlag(Loop, 11) = 2 Then Count2 = Count2 + 1
		End If
	End If
Next Loop
If Count1 = 0 Then
	GlobalMessage("The Titans have defended their ancient home!", BrightGreen)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 4 Then
			GiveObj(Loop, 484, 1)
			RunScript1("GameWarp", Loop)
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			RunScript1("Sprite", Loop)
			CalculateStats(Loop)
		End If
	Next Loop
End If
If Count2 = 0 Then
	GlobalMessage("The Invaders have defeated the Titans and conquered their fortress!", BrightGreen)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 4 Then
			GiveObj(Loop, 483, 1)
			RunScript1("GameWarp", Loop)
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			RunScript1("Sprite", Loop)
			CalculateStats(Loop)
		End If
	Next Loop
End If

End Function