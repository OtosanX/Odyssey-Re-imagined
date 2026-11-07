Function Main(Player as Long) AS LONG
dim Mon1 as Long, Mon2 as Long, Mon3 as Long, Mon4 as Long, Mon5 as Long, Mon6 as Long, Monster as Long

If GetMonsterTarget(GetPlayerMap(Player), 0) = Player Then Mon1 = 1
If GetMonsterTarget(GetPlayerMap(Player), 1) = Player Then Mon2 = 1
If GetMonsterTarget(GetPlayerMap(Player), 2) = Player Then Mon3 = 1
If GetMonsterTarget(GetPlayerMap(Player), 3) = Player Then Mon4 = 1
If GetMonsterTarget(GetPlayerMap(Player), 4) = Player Then Mon5 = 1
If GetMonsterTarget(GetPlayerMap(Player), 5) = Player Then Mon6 = 1

If GetPlayerFlag(Player, 23) = 0 Then
	SetPlayerFlag(Player, 23, 1)
	RunScript1("cooldown", Player)
		For Monster = 0 To 5
			AttackMonster(Player, Monster, 0)
		Next Monster

	If Mon1 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 0, Player)
	If Mon2 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 1, Player)
	If Mon3 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 2, Player)
	If Mon4 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 3, Player)
	If Mon5 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 4, Player)
	If Mon6 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 5, Player)
Else
	PlayerMessage(Player, "You must regenerate to cast again.", Grey)
End If

End Function