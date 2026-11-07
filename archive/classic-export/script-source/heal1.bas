Sub Main(Player as Long, Health as Long)

CreatePlayerFloatText(Player, str(Health), BrightGreen)
SetPlayerHP(Player, GetPlayerHP(Player) + Health)
If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))

End Sub