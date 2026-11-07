Sub Main(Player as Long)
dim Loop as Long

For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 10) = 16 Then
		PlayerWarp(Loop, 617, 5, 5)
		If GetPlayerFlag(Loop, 11) = 1 Then
			SetPlayerFlag(Loop, 226, GetPlayerFlag(Loop, 226) + 1)
			MapMessage(617, strcat(GetPlayerName(Loop), " has lost Snowball Tag!!"), Red)
			MapMessage(620, strcat(GetPlayerName(Loop), " has lost Snowball Tag!!"), Red)
		End If
		PlayerMessage(Loop, strcat("You got ", strcat(str(GetPlayerFlag(Loop, 12)), " hits!")), White)
		SetPlayerFlag(Loop, 227, GetPlayerFlag(Loop, 227) + 1)
		SetPlayerFlag(Loop, 10, 0)
		SetPlayerFlag(Loop, 11, 0)
		SetPlayerFlag(Loop, 12, 0)
		TakeObj(Loop, 383, HasObj(Loop, 383))
		RunScript1("Sprite", Loop)
		RunScript1("Restore", Loop)
	End If
Next Loop

End Sub