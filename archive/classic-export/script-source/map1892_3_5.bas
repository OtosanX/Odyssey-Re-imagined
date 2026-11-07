Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1892, 3, 4)
	Else
		PlayerWarp(Player, 1892, 3, 6)
	End If
Else
	PlayerWarp(Player, 1892, 3, 4)
End If

End Sub