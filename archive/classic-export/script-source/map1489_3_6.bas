Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, Monster as Long

Map = GetPlayerMap(Player)

For X = 3 To 7
	For Y = 3 To 8
		If Random(3) = 0 Then
			CreateTileEffect(Map, X, Y, 26, 40 + Random(20), 8, 0, 0)
				If GetPlayerX(Player) = X & GetPlayerY(Player) = Y Then
					MagicAttackPlayer(Player, Player, 42)
				End If
				For Monster = 0 To 5
					If GetMonsterX(1489, Monster) = X & GetMonsterY(1489, Monster) = Y Then
						'AttackMonster(Player, Monster, 10)
					End If
				Next Monster
		End If
	Next Y
Next X

End Function