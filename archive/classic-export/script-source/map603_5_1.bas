Sub Main(Player as Long)

If GetPlayerDirection(Player) = Up Then PlayerWarp(Player, 603, 5, 0)
If GetPlayerDirection(Player) = Down Then PlayerWarp(Player, 603, 5, 2)

End Sub