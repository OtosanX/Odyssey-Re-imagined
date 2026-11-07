Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Devast") | strcmp(GetPlayerUser(Player), "Inferno1") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1835, 5, 9)
	Else
		PlayerWarp(Player, 1835, 5, 7)
	End If
Else
	PlayerWarp(Player, 1835, 5, 7)
End If

End Sub