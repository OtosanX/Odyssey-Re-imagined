Sub Main(Player as Long)
'CTF Red Jail Warp

SetPlayerGuild(Player, 101)
SetPlayerSprite(Player, 133)
SetPlayerStatus(Player, 3)
SetPlayerFlag(Player, 12, 0)
PlayerWarp(Player, 78, 10, 10)

End Sub