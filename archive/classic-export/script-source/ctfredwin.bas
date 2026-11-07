Sub Main()
dim Loop as Long

GlobalMessage("Red Team wins CTF!", BrightGreen)
SetFlag(10, 0)
SetFlag(11, 0)
SetFlag(12, 0)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 6 Then
		If GetPlayerFlag(Loop, 11) = 1 Then
			GiveObj(Loop, 484, 1)
		End If
		SetPlayerFlag(Loop, 10, 0)
		SetPlayerFlag(Loop, 11, 0)
		SetPlayerFlag(Loop, 12, 0)
		SetPlayerGuild(Loop, GetPlayerFlag(Loop, 5))
		RunScript1("Sprite", Loop)
		RunScript1("GameWarp", Loop)
		If HasObj(Loop, 508) Then TakeObj(Loop, 508, HasObj(Loop, 508))
		If HasObj(Loop, 509) Then TakeObj(Loop, 509, HasObj(Loop, 509))
	End If
Next Loop

End Sub