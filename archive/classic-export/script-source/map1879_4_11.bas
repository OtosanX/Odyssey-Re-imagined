Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1879, 3, 11)
	Else
		PlayerWarp(Player, 1879, 5, 11)
	End If
Else
	PlayerWarp(Player, 1879, 5, 11)
End If

End Sub