Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") Then
	PlayerWarp(Player, 1432, 3, 8)
Else
	PlayerWarp(Player, 1432, 5, 3)
End If

End Sub