Sub Main(Player as Long)

If GetPlayerFlag(Player, 11) = 1 Then
	If GetPlayerMap(Player) = 1413 Then
		MapMessage(1413, strcat(GetPlayerName(Player), "!!"), BrightRed)
		MapMessage(1413, strcat("Health: ", str(GetPlayerHP(Player))), Red)
		GiveObj(Player, 392, 1)
		If GetPlayerFlag(Player, 216) < 3 Then SetPlayerFlag(Player, 216, 3)
		PlayerWarp(Player, 1413, 5, 5)
		SetPlayerFlag(Player, 10, 0)
		SetPlayerFlag(Player, 11, 0)
		SetFlag(96, 0)
	End If
End If

If GetPlayerFlag(Player, 11) = 2 Then
	If GetPlayerMap(Player) = 1413 Then
		MapMessage(1413, strcat(GetPlayerName(Player), "!!"), BrightRed)
		MapMessage(1413, strcat("Health: ", str(GetPlayerHP(Player))), Red)
		GiveObj(Player, 392, 1)
		If GetPlayerFlag(Player, 217) < 3 Then SetPlayerFlag(Player, 217, 3)
		PlayerWarp(Player, 1413, 5, 5)
		SetPlayerFlag(Player, 10, 0)
		SetPlayerFlag(Player, 11, 0)
		SetFlag(97, 0)
	End If
End If

End Sub