Function Main(Monster as Long, MonNum as Long, Player as Long) AS LONG

'Solo the Champ
If GetPlayerMap(Player) = 1828 Then
	Main = Stop
	RunScript1("GameWarp", Player)
	SetPlayerHP(Player, GetPlayerMaxHP(Player))
	ResetMap(1828)
	SetPlayerFlag(Player, 10, 0)
	SetFlag(90, 0)
Else
	If GetPlayerMap(Player) = 1829 Then
		Main = Stop
		RunScript1("GameWarp", Player)
		SetPlayerHP(Player, GetPlayerMaxHP(Player))
		ResetMap(1829)
		SetPlayerFlag(Player, 10, 0)
		SetFlag(95, 0)
	Else
		Main = Continue
	End If
End If

End Function