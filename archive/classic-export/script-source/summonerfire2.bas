Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, Monster as Long
dim RangeX as Long, RangeY as Long

Map = GetPlayerMap(Player)
If Map <> 1489 Then Exit Function
If GetFlag(93) > 1 Then Exit Function
X = GetMonsterX(1489, 0) - 1
Y = GetMonsterY(1489, 0) - 1

For RangeX = 0 To 2
	For RangeY = 0 To 2
		CreateTileEffect(Map, X, Y, 40, 30 + Random(20), 8, 0, 0)
			If GetPlayerX(Player) = X & GetPlayerY(Player) = Y Then
				MagicAttackPlayer(Player, Player, 42)
			End If
			For Monster = 1 To 5
				If GetMonsterX(1489, Monster) = X & GetMonsterY(1489, Monster) = Y Then
					AttackMonster(Player, Monster, 10)
				End If
			Next Monster
		Y = Y + 1
	Next RangeY
	X = X + 1
	Y = GetMonsterY(1489, 0) - 1
Next RangeX

SetFlag(92, GetFlag(92) + 1)
RunScript1("summonerfire", Player)

End Function