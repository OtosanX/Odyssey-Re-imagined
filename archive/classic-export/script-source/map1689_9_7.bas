Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") | strcmp(GetPlayerUser(Player), "NicolajBaltzer") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1689, 9, 8)
	Else
		PlayerWarp(Player, 1689, 9, 6)
	End If
Else
	PlayerWarp(Player, 1689, 9, 6)
End If

End Sub