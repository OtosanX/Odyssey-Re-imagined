Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1689, 5, 6)
	Else
		PlayerWarp(Player, 1689, 3, 6)
	End If
Else
	PlayerWarp(Player, 1689, 5, 6)
End If

End Sub