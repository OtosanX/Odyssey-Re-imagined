Sub Main(Player as Long)

If GetPlayerDirection(Player) = Up Then PlayerWarp(Player, 603, 2, 2)
If GetPlayerDirection(Player) = Down Then PlayerWarp(Player, 603, 2, 4)

End Sub