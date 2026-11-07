Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1903, 6, 2)
	Else
		PlayerWarp(Player, 1903, 6, 4)
	End If
Else
	PlayerWarp(Player, 1903, 6, 4)
End If

End Sub