Sub Main(Player as Long)

If GetPlayerFlag(Player, 120) > 0 Then
	SetPlayerFlag(Player, 120, 0)
	PlayerMessage(Player, "You have regained normal endurance.", Grey)
	CalculateStats(Player)
End If

End Sub