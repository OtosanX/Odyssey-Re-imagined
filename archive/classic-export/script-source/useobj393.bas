Function Main(Player as Long) as Long

PlayerMessage(Player, "The presense of the Torch restores you.", White)
SetPlayerFlag(Player, 124, 7)
CalculateStats(Player)

End Function