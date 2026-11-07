Sub Main(Player as Long)
'CTF Blue Jail Warp

SetPlayerGuild(Player, 100)
SetPlayerSprite(Player, 132)
SetPlayerStatus(Player, 17)
SetPlayerFlag(Player, 12, 0)
PlayerWarp(Player, 70, 1, 10)

End Sub