Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1892, 9, 6)
	Else
		PlayerWarp(Player, 1892, 9, 4)
	End If
Else
	PlayerWarp(Player, 1892, 9, 6)
End If

End Sub