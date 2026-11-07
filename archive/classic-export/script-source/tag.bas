Sub Main(Player as Long)

If GetPlayerFlag(Player, 209) > 0 Then
	PlayerMessage(Player, strcat(GetPlayerName(GetPlayerFlag(Player, 209)), strcat(" has been tracked to ", GetMapName(GetPlayerMap(GetPlayerFlag(Player, 209))))), Yellow)
	SetPlayerFlag(Player, 209, 0)
End If

End Sub