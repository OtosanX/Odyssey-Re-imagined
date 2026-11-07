Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	PlayerWarp(Player, 1902, 0, 3)
Else
	PlayerWarp(Player, 1902, 1, 5)
End If

End Sub