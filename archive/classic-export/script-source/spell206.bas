Sub Main(Player as Long)
dim Mana as Long
'Cleric Damnation
Mana = 50

If HasObj(Player, 413) = 0 Then
	PlayerMessage(Player, "You require Holy Water to cast this spell.", Grey)
	Exit Sub
End If
If GetPlayerMana(Player) < Mana Then
	PlayerMessage(Player, "You must regenerate before casting.", Grey)
	Exit Sub
End If

If GetPlayerFlag(Player, 208) = 0 Then
	SetPlayerMana(Player, GetPlayerMana(Player) - Mana)
	PlayerMessage(Player, "Damnation has been activated. Click a dead enemy to cast.", BrightGreen)
	SetPlayerFlag(Player, 208, 1)
Else
	PlayerMessage(Player, "Damnation has been deactivated.", Grey)
	SetPlayerFlag(Player, 208, 0)
End If

End Sub