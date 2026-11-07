Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long, Monster as Long

Map = GetPlayerMap(Player)
X = Random(4) + 3
Y = Random(4) + 3

SpawnMonster(Map, 235, X, Y, 0)
CreateTileEffect(Map, X, Y, 36, 40, 8, 0, 0)

For Monster = 0 To 5
	SetMonsterTarget(1489, Monster, Player)
Next Monster

End Function