Function Main(Player as Long) AS LONG
dim Chance as Long, Object as Long, X as Long, Y as Long

'Mini-Game
If GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then
	GlobalMessage(strcat(GetPlayerName(Player), " has just solo'd the Vorpal Bunny!!"), BrightRed)
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
	If GetPlayerFlag(Player, 215) < 3 Then SetPlayerFlag(Player, 215, 3)
	SetPlayerFlag(Player, 10, 0)
Exit Function
End If

GivePlayerExp(Player, 15000)

'Vorp Helm
Chance = 25
Object = 498
RunScript3("RareDrop", Player, Chance, Object)

End Function