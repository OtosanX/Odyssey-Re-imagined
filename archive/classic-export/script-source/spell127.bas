Sub Main(Player as Long)
Dim Effect as Long, Damage as Long, Mana as Long
'Meteor Blast - Mage Spell
If GetPlayerMap(Player) = 1427 Then Exit Sub
'SetEquippedItemSuffix(Player,5,255)
Effect = 23
Mana = 14
Damage = GetPlayerDamage(Player) + 1
'If GetPlayerStrength(Player) > 0 Then Damage = Damage - Divide((GetPlayerStrength(Player)+2),5)
If Damage < 0 Then Damage = 0

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
CreatePlayerMagicProjectile(Player, GetPlayerDirection(Player), Effect, Damage)

End Sub