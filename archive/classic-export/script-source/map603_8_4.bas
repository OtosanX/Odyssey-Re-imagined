Sub Main(Player as Long)

If GetPlayerDirection(Player) = Left Then PlayerWarp(Player, 603, 7, 4)
If GetPlayerDirection(Player) = Right Then PlayerWarp(Player, 603, 9, 4)

End Sub