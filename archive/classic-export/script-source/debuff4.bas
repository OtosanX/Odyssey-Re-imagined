Sub Main(Player as Long)

If GetPlayerFlag(Player, 123) > 0 Then
	SetPlayerFlag(Player, 123, 0)
	PlayerMessage(Player, "You have regained normal strength.", Grey)
	CalculateStats(Player)
End If

End Sub