Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Devast") | strcmp(GetPlayerUser(Player), "Inferno1") Then
	PlayerWarp(Player, 1840, 3, 5)
Else
	PlayerWarp(Player, 1840, 3, 8)
End If

End Sub