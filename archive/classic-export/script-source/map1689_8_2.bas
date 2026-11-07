Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") | strcmp(GetPlayerUser(Player), "JackRabbit2") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1689, 9, 2)
	Else
		PlayerWarp(Player, 1689, 7, 2)
	End If
Else
	PlayerWarp(Player, 1689, 7, 2)
End If

End Sub