Sub Main(Player as Long)

If GetPlayerDirection(Player) = Left Then PlayerWarp(Player, 603, 0, 2)
If GetPlayerDirection(Player) = Right Then PlayerWarp(Player, 603, 2, 2)

End Sub