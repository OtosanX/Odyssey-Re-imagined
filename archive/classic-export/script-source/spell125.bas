Sub Main(Player as Long)
Dim Effect as Long, Damage as Long, Mana as Long
'Major Fireball - Mage Spell
If GetPlayerMap(Player) = 1427 Then Exit Sub
Effect = 7
Mana = 5
Damage = GetPlayerDamage(Player)
	If GetPlayerStrength(Player) > 0 Then Damage = Damage - Divide((GetPlayerStrength(Player)+2),5)
Damage = Damage - 1
	If Damage < 0 Then Damage = 0

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), Effect, Damage)

End Sub