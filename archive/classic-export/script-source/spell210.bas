Sub Main(Player As Long)
'Cleric Resurrect

If HasObj(Player, 411) Then
	If GetPlayerFlag(Player, 90) = 0 Then
		SetPlayerFlag(Player, 90, 1)
		PlayerMessage(Player, "Resurrect has been activated.  Click a dead player to resurrect them", BrightGreen)
	Else
		SetPlayerFlag(Player, 90, 0)
		PlayerMessage(Player, "Resurrect has been de-activated.", Grey)
	End If
Else
	PlayerMessage(Player, "You require a Living Essence to cast this.", Grey)
End If

End Sub