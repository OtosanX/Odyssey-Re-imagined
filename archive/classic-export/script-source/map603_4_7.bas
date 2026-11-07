Sub Main(Player as Long)

If GetPlayerDirection(Player) = Right Then PlayerWarp(Player, 603, 5, 7)
If GetPlayerDirection(Player) = Left Then PlayerWarp(Player, 603, 3, 7)

End Sub