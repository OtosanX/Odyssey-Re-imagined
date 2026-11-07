Function Main(Player as Long) AS LONG
dim Mon1 as Long, Mon2 as Long, Mon3 as Long, Mon4 as Long, Mon5 as Long, Mon6 as Long
SetPlayerFlag(Player, 4, 0)

If GetMonsterTarget(GetPlayerMap(Player), 0) = Player Then Mon1 = 1
If GetMonsterTarget(GetPlayerMap(Player), 1) = Player Then Mon2 = 1
If GetMonsterTarget(GetPlayerMap(Player), 2) = Player Then Mon3 = 1
If GetMonsterTarget(GetPlayerMap(Player), 3) = Player Then Mon4 = 1
If GetMonsterTarget(GetPlayerMap(Player), 4) = Player Then Mon5 = 1
If GetMonsterTarget(GetPlayerMap(Player), 5) = Player Then Mon6 = 1

If GetPlayerFlag(Player, 24) = GetPlayerMap(Player) & GetPlayerFlag(Player, 21) = GetPlayerX(Player) & GetPlayerFlag(Player, 22) = GetPlayerY(Player) Then
	PlayerWarp(Player, 2000, 5, 5)
	PlayerWarp(Player, GetPlayerFlag(Player, 24), GetPlayerFlag(Player, 21), GetPlayerFlag(Player, 22))
	PlayerMessage(Player, "You have been unfrozen.", Grey)
	If Mon1 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 0, Player)
	If Mon2 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 1, Player)
	If Mon3 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 2, Player)
	If Mon4 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 3, Player)
	If Mon5 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 4, Player)
	If Mon6 = 1 Then SetMonsterTarget(GetPlayerMap(Player), 5, Player)
Else
	PlayerMessage(Player, "You aren't frozen, you dirty liar.", Grey)
End If

End Function