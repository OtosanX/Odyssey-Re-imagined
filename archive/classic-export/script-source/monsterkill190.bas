Function Main(MonNum as Long, Monster as Long, Player as Long) AS LONG

'Jims Face
If GetPlayerMap(Player) = 1413 Then
	If GetPlayerFlag(Player, 11) = 1 Then
		Main = Stop
		PlayerWarp(Player, 1413, 4, 1)
		SetPlayerHP(Player, GetPlayerMaxHP(Player))
		SetPlayerFlag(Player, 10, 0)
		SetPlayerFlag(Player, 11, 0)
		SetFlag(96, 0)
		MagicAttackMonster(Player, Monster, 255)
	End If

	If GetPlayerFlag(Player, 11) = 2 Then
		Main = Stop
		PlayerWarp(Player, 1413, 6, 1)
		SetPlayerHP(Player, GetPlayerMaxHP(Player))
		SetPlayerFlag(Player, 10, 0)
		SetPlayerFlag(Player, 11, 0)
		SetFlag(97, 0)
		AttackMonster(Player, Monster, 255)
	End If
End If

End Function