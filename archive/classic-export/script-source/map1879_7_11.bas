Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1879, 8, 11)
	Else
		PlayerWarp(Player, 1879, 6, 11)
	End If
Else
	PlayerWarp(Player, 1879, 6, 11)
End If

End Sub