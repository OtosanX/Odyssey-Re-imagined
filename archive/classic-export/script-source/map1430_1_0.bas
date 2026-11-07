Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") Then
	PlayerWarp(Player, 1430, 3, 9)
Else
	PlayerWarp(Player, 1430, 1, 1)
End If

End Sub