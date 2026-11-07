Function Main(Player as Long) AS LONG
Dim Health as Long, Mana as Long

Health = 25
Mana = 39

If GetPlayerHP(Player) >= Health Then
	SetPlayerHP(Player, GetPlayerHP(Player) - Health)
	SetPlayerMana(Player, GetPlayerMana(Player) + Mana)
	If GetPlayerMana(Player) > GetPlayerMaxMana(Player) Then SetPlayerMana(Player, GetPlayerMaxMana(Player))
	CreateCharacterEffect(GetPlayerMap(Player), Player, 30, 40, 8, 0, 0)
	CreatePlayerFloatText(Player, "Kon Zen Trat!", BrightGreen)
Else
	PlayerMessage(Player, "You are too close to death.", grey)
End If

End Function