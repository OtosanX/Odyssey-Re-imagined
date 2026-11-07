Sub Main(Player as Long)

While HasObj(Player, 362)
	TakeObj(Player, 362, 1)
Wend

If GetPlayerFlag(Player, 11) = 1 Then
	PlayerWarp(Player, 1427, 11, 1)
	SetPlayerSprite(Player, 1)
	SetPlayerFlag(Player, 11, 3)
	MapMessage(1427, strcat(GetPlayerName(Player), " steps out of bounds!"), Red)
End If
If GetPlayerFlag(Player, 11) = 2 Then
	PlayerWarp(Player, 1427, 0, 10)
	SetPlayerSprite(Player, 7)
	SetPlayerFlag(Player, 11, 4)
	MapMessage(1427, strcat(GetPlayerName(Player), " steps out of bounds!"), Blue)
End If

If GetFlag(143) = 0 | GetFlag(144) = 0 Then RunScript0("DodgeballWin")

End Sub