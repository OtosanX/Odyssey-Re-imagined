Sub Main(Player as Long)

If GetPlayerHP(Player) < GetPlayerMaxHP(Player) Then PlayerWarp(Player, 120, 3, 8)

End Sub