Sub Main(Player as Long)

If GetPlayerFlag(Player, 122) > 0 Then
	SetPlayerFlag(Player, 122, 0)
	PlayerMessage(Player, "You have regained normal intelligence.", Grey)
	CalculateStats(Player)
End If

End Sub