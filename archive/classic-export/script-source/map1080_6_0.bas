Sub Main(Player as Long)

If strcmp(GetPlayerName(Player), "Carrera") Then
	PlayerWarp(Player, 1080, 4, 8)
Else
	PlayerWarp(Player, 1080, 6, 2)
End If

End Sub