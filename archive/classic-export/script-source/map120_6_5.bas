Sub Main(Player as Long)

If GetPlayerHP(Player) < GetPlayerMaxHP(Player) Then PlayerWarp(Player, 120, 6, 6)

End Sub