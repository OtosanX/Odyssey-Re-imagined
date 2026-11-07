Sub Main(Player as Long)
Dim Health as Long, Energy as Long
'Knight Spell - Sacrafice Energy for Hp
Health = Divide(GetPlayerMaxHP(Player), 5)
Energy = 25
	'SetPlayerFlag(Player



if getplayerflag(player, 250) = 0 | getplayerflag(player,250) < 4 then
	playermessage(player, "You must be a venerate Cleric to use this spell.", white)
	exit sub
end if


If GetPlayerFlag(Player, 23) = 1 Then
PlayerMessage(Player, "Cooling down.", Grey)
exit sub
end if
	
	
If GetPlayerEnergy(Player) >= Health Then
	SetPlayerEnergy(Player, GetPlayerEnergy(Player) - Energy)
	SetPlayerHP(Player, GetPlayerHP(Player) + Health)
	If GetPlayerHP(Player) > GetPlayerMaxHP(Player) Then SetPlayerHP(Player, GetPlayerMaxHP(Player))
	SetPlayerFlag(Player, 23, 1)
	Timer(Player, 30, "Cooldown")
	CreateCharacterEffect(GetPlayerMap(Player), Player, 18, 40, 9, 0, 0)
	'CreatePlayerFloatText(Player, "Abi la Diaz!", BrightRed)
	CreatePlayerFloatText(Player, str(Health), BrightGreen)
Else
	PlayerMessage(Player, "You do not have enough Energy.", Grey)
End If

End Sub