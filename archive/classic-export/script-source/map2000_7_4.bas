Function Main(Player as Long) as Long
dim Map as Long, X as Long, Y as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

PlayerMessage(Player, str(Map), Green)
PlayerMessage(Player, str(X), Green)
PlayerMessage(Player, str(Y), Green)

End Function