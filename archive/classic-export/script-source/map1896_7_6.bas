Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Wish") | strcmp(GetPlayerUser(Player), "Jeromeb") Then
	PlayerWarp(Player, 120, 6, 9)
Else
	PlayerWarp(Player, 1896, 7, 7)
End If

End Sub