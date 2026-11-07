Function Main(Monster as Long, MonNum as Long, Player as Long) as Long

PlayerWarp(Player, GetPlayerFlag(Player, 210), GetPlayerFlag(Player, 211), GetPlayerFlag(Player, 212))
PlayerMessage(Player, "You return as if nothing ever happened.", White)

Main = Stop

End Function