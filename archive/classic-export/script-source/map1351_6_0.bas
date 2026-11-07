Function Main(Player as Long) AS LONG

If GetMapPlayerCount(1352) = 0 Then
	ResetMap(1352)
	PlayerWarp(Player, 1352, 5, 10)
Else
	PlayerWarp(Player, 1351, 6, 1)
	PlayerMessage(Player, "There is already someone in there.", Grey)
End If

End Function