Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long
dim Loop as Long, Monster as Long

Map = GetPlayerMap(Player)

For Loop = 1 To 2
	Y = Random(5) + 2
	For X = 1 To 9
		CreateTileEffect(Map, X, Y, 1, 40, 8, 0, 0)
			If GetPlayerX(Player) = X & GetPlayerY(Player) = Y Then
				MagicAttackPlayer(Player, Player, 44)
			End If
			For Monster = 0 To 5
				If GetMonsterX(1489, Monster) = X & GetMonsterY(1489, Monster) = Y Then
					AttackMonster(Player, Monster, 15)
				End If
			Next Monster
	Next X
Next Loop

End Function