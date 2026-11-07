Sub Main(Player as Long)

If GetPlayerFlag(Player, 96) = 0 Then
	SetPlayerFlag(Player, 96, 1)
	PlayerMessage(Player, "Sacrifice has been activated.  Click a player to donate your magic.", BrightGreen)
Else
	SetPlayerFlag(Player, 96, 0)
	PlayerMessage(Player, "Sacrifice has been de-activated.", Grey)
End If

End Sub