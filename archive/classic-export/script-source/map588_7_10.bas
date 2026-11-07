Sub Main(Player as Long)

PlayerWarp(Player, 588, 7, 11)
If GetPlayerDirection(Player) = Up Then PlayerMessage(Player, "The ledge is just out of reach.", White)

End Sub