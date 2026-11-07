Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1689, 7, 2)
	Else
		PlayerWarp(Player, 1689, 7, 4)
	End If
Else
	PlayerWarp(Player, 1689, 7, 4)
End If

End Sub