Sub Main(Player as Long)

If GetPlayerFlag(Player, 121) > 0 Then
	SetPlayerFlag(Player, 121, 0)
	PlayerMessage(Player, "You have regained normal agility.", Grey)
	CalculateStats(Player)
End If

End Sub