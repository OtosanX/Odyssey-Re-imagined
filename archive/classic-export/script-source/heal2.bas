Sub Main(Player as Long)
Dim Health as Long

'Health = GetPlayerDamage(Player) - 35
Health = 7
If Health < 2 Then Health = 2


CreateCharacterEffect(GetPlayerMap(Player), Player, 31, 30, 8, 1, 0)
'CreatePlayerFloatText(Player, str(Health), BrightGreen)
CreatePlayerFloatText(Player, " 7 ", BrightGreen)
SetPlayerHP(Player, GetPlayerHP(Player) + Health)
If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))

'Timer(Player, 1, "heal3")

End Sub