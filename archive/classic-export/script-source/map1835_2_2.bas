Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Devast") | strcmp(GetPlayerUser(Player), "Inferno1") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1835, 2, 1)
	Else
		PlayerWarp(Player, 1835, 2, 3)
	End If
Else
	PlayerWarp(Player, 1835, 2, 3)
End If

End Sub