Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long

SetPlayerFlag(Player, 255, GetPlayerFlag(Player, 255) - 1)
Map = GetPlayerMap(GetPlayerFlag(Player, 255))
X = GetPlayerX(GetPlayerFlag(Player, 255))
Y = GetPlayerY(GetPlayerFlag(Player, 255))

PlayerWarp(Player, Map, X, Y)

End Sub