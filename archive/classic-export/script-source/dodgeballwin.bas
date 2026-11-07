Sub Main()
dim Loop as Long, Count1 as Long, Count2 as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 12 Then
		If GetPlayerFlag(Loop, 11) = 1 Then Count1 = Count1 + 1
		If GetPlayerFlag(Loop, 11) = 2 Then Count2 = Count2 + 1
	End If
Next Loop

If Count1 = 0 & GetFlag(143) = 0 Then	'Red Lose
	GlobalMessage("Blue Team has won Dodgeball!", BrightBlue)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 12 Then
			If GetPlayerFlag(Loop, 11) = 2 | GetPlayerFlag(Loop, 11) = 4 Then GiveObj(Loop, 483, 1)
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			RunScript1("GameWarp", Loop)
			RunScript1("Sprite", Loop)
		End If
		While HasObj(Loop, 362)
			TakeObj(Loop, 362, 1)
		Wend
	Next Loop
	ResetMap(1427)
End If
If Count2 = 0 & GetFlag(144) = 0 Then	'Blue Lose
	GlobalMessage("Red Team has won Dodgeball!", BrightRed)
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 12 Then
			If GetPlayerFlag(Loop, 11) = 1 | GetPlayerFlag(Loop, 11) = 3 Then GiveObj(Loop, 483, 1)
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 11, 0)
			SetPlayerFlag(Loop, 12, 0)
			SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
			RunScript1("GameWarp", Loop)
			RunScript1("Sprite", Loop)
		End If
		While HasObj(Loop, 362)
			TakeObj(Loop, 362, 1)
		Wend
	Next Loop
	ResetMap(1427)
End If

End Sub