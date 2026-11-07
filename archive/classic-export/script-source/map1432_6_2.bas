Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") | strcmp(GetPlayerUser(Player), "Xin") Then
	PlayerWarp(Player, 1432, 8, 8)
Else
	PlayerWarp(Player, 1432, 6, 3)
End If

End Sub