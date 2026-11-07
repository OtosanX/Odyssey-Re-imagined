Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1879, 10, 10)
	Else
		PlayerWarp(Player, 1879, 10, 8)
	End If
Else
	PlayerWarp(Player, 1879, 10, 8)
End If

End Sub