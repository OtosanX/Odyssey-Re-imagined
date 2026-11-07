Sub Main(Player as Long)

PlayerWarp(Player, 1443, 5, 10)
SetPlayerFlag(Player, 10, 0)
SetPlayerFlag(Player, 11, 0)
SetPlayerFlag(Player, 12, 0)
RunScript1("Sprite", Player)
SetPlayerGuild(Player, GetPlayerFlag(Player, 5))
PlayerMessage(Player, "You have left the Red Team", White)

End Sub