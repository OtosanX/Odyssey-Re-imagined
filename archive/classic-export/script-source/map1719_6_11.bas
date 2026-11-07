Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sting") | strcmp(GetPlayerUser(Player), "Revolutionar") | strcmp(GetPlayerUser(Player), "Scorpio") Then
	PlayerWarp(Player, 1718, 8, 2)
Else
	PlayerWarp(Player, 1719, 6, 10)
End If

End Sub