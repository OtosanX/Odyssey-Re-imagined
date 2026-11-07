Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") | strcmp(GetPlayerUser(Player), "Xin") Then
	PlayerWarp(Player, 1430, 8, 9)
Else
	PlayerWarp(Player, 1430, 10, 1)
End If

End Sub