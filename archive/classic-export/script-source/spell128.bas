Sub Main(Player as Long)
dim Mana as Long
'Mage Spell - Evil Eye

Mana = 40

If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to cast.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate to cast.", Grey)
	Exit Sub
End If

SetPlayerMana(Player, GetPlayerMana(Player) - Mana)

If GetPlayerFlag(Player, 204) = 0 Then
	SetPlayerFlag(Player, 204, 1)
	PlayerMessage(Player, "Evil Eye has been activated. Click a player to track them.", Yellow)
Else
	SetPlayerFlag(Player, 204, 0)
	PlayerMessage(Player, "Evil Eye has been deactivated.", Grey)
End If

End Sub