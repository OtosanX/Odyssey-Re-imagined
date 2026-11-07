Function Main(Player as Long) AS LONG

If GetMapPlayerCount(1972) = 0 Then
	PlayerWarp(Player, 1972, 6, 11)
	ResetMap(1972)
Else
	PlayerWarp(Player, 1971, 6, 1)
	PlayerMessage(Player, "One at a time to see the Landlord, thank you.", Grey)
End If

End Function