Sub Main(Killer as Long, Killed as Long)

If GetPlayerFlag(Killed, 11) = 1 Then
If GetPlayerFlag(Killer, 11) = 1 Then Exit Sub
	PlayerWarp(Killed, 1427, 11, 1)
	SetPlayerSprite(Killed, 1)
	SetPlayerFlag(Killed, 11, 3)
	If GetPlayerFlag(Killer, 11) = 1 Then
		MapMessage(1427, strcat(GetPlayerName(Killer), strcat(" knocks out ", strcat(GetPlayerName(Killed), " from his own team!"))), Red)
	Else
		MapMessage(1427, strcat(GetPlayerName(Killer), strcat(" knocks out ", strcat(GetPlayerName(Killed), "!"))), Blue)
	End If
SetFlag(144, GetFlag(144) + 1)
End If
If GetPlayerFlag(Killed, 11) = 2 Then
If GetPlayerFlag(Killer, 11) = 2 Then Exit Sub
	PlayerWarp(Killed, 1427, 0, 10)
	SetPlayerSprite(Killed, 7)
	SetPlayerFlag(Killed, 11, 4)
	If GetPlayerFlag(Killer, 11) = 2 Then
		MapMessage(1427, strcat(GetPlayerName(Killer), strcat(" knocks out ", strcat(GetPlayerName(Killed), " from his own team!"))), Blue)
	Else
		MapMessage(1427, strcat(GetPlayerName(Killer), strcat(" knocks out ", strcat(GetPlayerName(Killed), "!"))), Red)
	End If
	SetFlag(143, GetFlag(143) + 1)
End If

SetPlayerHP(Killed, GetPlayerMaxHP(Killed))
If HasObj(Killed, 362) Then TakeObj(Killed, 362, HasObj(Killed, 362))
RunScript0("DodgeballWin")

End Sub