Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, Loop as Long

Map = GetPlayerMap(Player)

If Map <> 1489 Then Exit Function
If GetFlag(93) > 2 Then Exit Function

For Loop = 1 To 2
	X = Random(4) + 3
	Y = Random(4) + 3

	SpawnMonster(Map, 235, X, Y, 0)
	CreateTileEffect(Map, X, Y, 36, 40, 8, 0, 0)
Next Loop

For Loop = 0 To 5
	SetMonsterTarget(1489, Loop, Player)
Next Loop

PlayerMessage(Player, "The Summoner spawns minions from the ethreal world!", White)

End Function