Function Main(Mon as Long, MonNum as Long, Player as Long) AS LONG

Main = Stop
RunScript1("GameWarp", Player)
PlayerMessage(Player, "You have been killed by a Touch of Fank!", BrightRed)
SetPlayerHP(Player, GetPlayerMaxHP(Player))

End Function