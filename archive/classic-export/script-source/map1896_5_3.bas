Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jeromeb") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1896, 5, 2)
	Else
		PlayerWarp(Player, 1896, 5, 4)
	End If
Else
	PlayerWarp(Player, 1896, 5, 4)
End If

End Sub