Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1904, 7, 8)
	Else
		PlayerWarp(Player, 1904, 7, 10)
	End If
Else
	PlayerWarp(Player, 1904, 7, 8)
End If

End Sub