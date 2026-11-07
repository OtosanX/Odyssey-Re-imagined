Sub Main(Player as Long)
Dim Health as Long, Energy as Long
'Knight Spell - Sacrafice Energy for Hp
Health = Divide(GetPlayerMaxHP(Player), 6)
Energy = 75
	'SetPlayerFlag(Player
'If GetPlayerEnergy(Player) >= Health Then
	'SetPlayerEnergy(Player, GetPlayerEnergy(Player) - Energy)
	SetPlayerHP(Player, GetPlayerHP(Player) + Health)
	If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
	CreateCharacterEffect(GetPlayerMap(Player), Player, 18, 40, 9, 0, 0)
	'CreatePlayerFloatText(Player, "Abi la Diaz!", BrightRed)
	CreatePlayerFloatText(Player, str(Health), BrightGreen)
'Else
'	PlayerMessage(Player, "You do not have enough Energy.", Grey)
'End If

End Sub