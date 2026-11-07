Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") Then
	PlayerWarp(Player, 1905, 0, 4)
Else
	PlayerWarp(Player, 1905, 6, 11)
End If

End Sub