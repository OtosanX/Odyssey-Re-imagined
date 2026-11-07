Sub Main(Player as Long)
Dim Energy as Long, Mana as Long
'Cleric Spell - Convert


If GetPlayerFlag(Player, 82) = 1 Then
PlayerMessage(Player, "Cooling down.", Grey)
exit sub
end if

Energy = 85
Mana = 125 

If GetPlayerenergy(Player) >= Energy Then
	SetPlayerFlag(Player, 82, 1)
	Timer(Player, 300 , "Convertimer")
	SetPlayerEnergy(Player, GetPlayerEnergy(Player) - Energy)
	SetPlayerMana(Player, GetPlayerMana(Player) + Mana)
	If GetPlayerMana(Player) > GetPlayerMaxMana(Player) Then SetPlayerMana(Player, GetPlayerMaxMana(Player))
	CreateCharacterEffect(GetPlayerMap(Player), Player, 30, 40, 8, 0, 0)
	CreatePlayerFloatText(Player, "Convert!", BrightGreen)
'	CreatePlayerFloatText(Player, str(Health), BrightRed)
Else
	PlayerMessage(Player, "You don't have enough energy.", Grey)
End If

End Sub