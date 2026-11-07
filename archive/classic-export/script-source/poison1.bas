Sub Main(Player as Long)
dim Attacker as Long, Damage as Long

Attacker = GetPlayerFlag(Player, 33)
Damage = GetPlayerFlag(Player, 31)

If IsPlaying(Attacker) Then
	If GetPlayerFlag(Attacker, 32) > 0 Then
'		MagicAttackPlayer(Attacker, Player, Damage)
		SetPlayerHP(Player, GetPlayerHP(Player) - Damage)
		CreatePlayerFloatText(Player, str(Damage), BrightRed)
		CreateCharacterEffect(GetPlayerMap(Player), Player, 18, 40, 2, 2, 0)
		If GetPlayerHP(Player) < 2 Then MagicAttackPlayer(Attacker, Player, 255)
		Timer(Player, 2, "Poison1")
		Exit Sub
	End If
End If

RunScript1("PoisonCooldown", Player)

End Sub