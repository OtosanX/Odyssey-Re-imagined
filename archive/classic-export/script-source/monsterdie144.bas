Function Main(Player as Long) AS LONG
dim Chance as Long, Object as Long, X as Long, Y as Long

'Mini-Game
If GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then
	GlobalMessage(strcat(GetPlayerName(Player), " has just solo'd the Bremen!!"), BrightRed)
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
	If GetPlayerFlag(Player, 215) < 2 Then
		SetPlayerFlag(Player, 215, 2)
		GiveObj(Player, 484, 1)
	Else
		GiveObj(Player, 483, 1)
	End If
	RunScript1("Restore", Player)
	SetPlayerFlag(Player, 10, 0)
Exit Function
End If

'Bremen Cape
Chance =  30
Object = 462
RunScript3("RareDrop", Player, Chance, Object)

End Function