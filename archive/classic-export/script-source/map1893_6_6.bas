Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1893, 6, 5)
	Else
		PlayerWarp(Player, 1893, 6, 7)
	End If
Else
	PlayerWarp(Player, 1893, 6, 7)
End If

End Sub