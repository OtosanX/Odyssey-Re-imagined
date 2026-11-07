Sub Main(Player as Long)
dim Mana as Long
'Cleric Damnation
Mana = 50

If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

If GetPlayerFlag(Player, 196) = 0 Then
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	PlayerMessage(Player, "Damnation has been activated. Click a dead enemy to cast.", BrightGreen)
	SetPlayerFlag(Player, 196, 1)
Else
	PlayerMessage(Player, "Damnation has been deactivated.", Grey)
	SetPlayerFlag(Player, 196, 0)
End If

End Sub