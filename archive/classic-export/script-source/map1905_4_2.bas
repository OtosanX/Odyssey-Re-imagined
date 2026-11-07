Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zef") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1905, 4, 1)
	Else
		PlayerWarp(Player, 1905, 4, 3)
	End If
Else
	PlayerWarp(Player, 1905, 4, 3)
End If

End Sub