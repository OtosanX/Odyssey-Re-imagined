Function Main(Player as Long) AS LONG

'Mini-Game
If GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then
	GlobalMessage(strcat(GetPlayerName(Player), " has just solo'd a Touch of Death!!"), BrightRed)
	If GetPlayerMap(Player) = 1828 Then
		MapMessage(1828, strcat("Health: ", str(GetPlayerHP(Player))), Red)
		PlayerWarp(Player, 1828, 5, 1)
		SetFlag(90, 0)
	End If
	If GetPlayerMap(Player) = 1829 Then
		MapMessage(1829, strcat("Health: ", str(GetPlayerHP(Player))), Red)
		PlayerWarp(Player, 1829, 5, 1)
		SetFlag(95, 0)
	End If
	RunScript1("Restore", Player)
	GiveObj(Player, 484, 1)
	If GetPlayerFlag(Player, 215) < 4 Then SetPlayerFlag(Player, 215, 4)
	SetPlayerFlag(Player, 10, 0)
Exit Function
End If

End Function