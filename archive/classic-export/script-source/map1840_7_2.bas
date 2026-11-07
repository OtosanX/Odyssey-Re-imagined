Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Devast") | strcmp(GetPlayerUser(Player), "Inferno1") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1840, 7, 1)
	Else
		PlayerWarp(Player, 1840, 7, 3)
	End If
Else
	PlayerWarp(Player, 1840, 7, 3)
End If

End Sub