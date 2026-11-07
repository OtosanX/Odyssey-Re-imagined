Sub Main(Player as Long)
Dim Effect as Long, Damage as Long, Mana as Long
'Void Bolt - Mage Spell
If GetPlayerMap(Player) = 1427 Then Exit Sub
Effect = 18
Mana = 3
Damage = GetPlayerDamage(Player)
	If GetPlayerStrength(Player) > 0 Then Damage = Damage - Divide((GetPlayerStrength(Player) +2),5)
	Damage = Damage - 3
	If Damage < 0 Then Damage = 0

If GetPlayerMana(Player) < Mana Then
	Exit Sub
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), Effect, Damage)

End Sub