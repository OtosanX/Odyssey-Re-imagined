Function Main(Player as Long) AS LONG

If GetMapPlayerCount(882) = 0 Then
	PlayerWarp(Player, 882, 5, 0)
	ResetMap(882)
Else
	PlayerWarp(Player, 881, 5, 10)
	PlayerMessage(Player, "There is already someone in the treasure room.", Grey)
End If

End Function