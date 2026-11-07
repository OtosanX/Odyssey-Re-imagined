Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1879, 6, 6)
	Else
		PlayerWarp(Player, 1879, 6, 8)
	End If
Else
	PlayerWarp(Player, 1879, 6, 8)
End If

End Sub