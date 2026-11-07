Sub Main(Player as Long, Target as Long)
dim Mana as Long

Mana = Divide(GetPlayerMana(Player), 3)

If GetTileAtt(GetPlayerMap(Player), GetPlayerX(Player), GetPlayerY(Player)) = 6 Then
	PlayerMessage(Player, "You cannot cast here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast again.", Grey)
	Exit Sub
End If
	SetPlayerFlag(Player, 23, 1)
	RunScript1("SpellCooldown", Player)
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	SetPlayerMana(Target, GetPlayerMana(Target) + Mana)
	If GetPlayerMana(Target) > GetPlayerMaxMana(Target) Then SetPlayerMana(Target, GetPlayerMaxMana(Target))
	CreatePlayerFloatText(Player, "Victima!", BrightGreen)
	CreatePlayerFloatText(Target, str(Mana), BrightBlue)
	CreateCharacterEffect(GetPlayerMap(Target), Target, 2, 40, 8, 0, 0)
	SetPlayerFlag(Player, 96, 0)

End Sub