Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Devast") | strcmp(GetPlayerUser(Player), "Inferno1") Then
	PlayerWarp(Player, 1840, 4, 5)
Else
	PlayerWarp(Player, 1840, 4, 8)
End If

End Sub