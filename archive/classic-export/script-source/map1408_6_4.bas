Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Bardock") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1408, 6, 3)
	Else
		PlayerWarp(Player, 1408, 6, 5)
	End If
Else
	PlayerWarp(Player, 1408, 6, 5)
End If

End Sub