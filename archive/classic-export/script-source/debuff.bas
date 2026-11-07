Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 121) > 0 Then
	SetPlayerFlag(Player, 121, 0)
	PlayerMessage(Player, "You have regained normal agility.", Grey)
End If
If GetPlayerFlag(Player, 122) > 0 Then
	SetPlayerFlag(Player, 122, 0)
	PlayerMessage(Player, "You have regained normal intelligence.", Grey)
End If
If GetPlayerFlag(Player, 123) > 0 Then
	SetPlayerFlag(Player, 123, 0)
	PlayerMessage(Player, "You have regained normal strength.", Grey)
End If
CalculateStats(Player)
End Function