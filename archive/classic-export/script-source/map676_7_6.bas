Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 676, 7, 7)
	Else
		PlayerWarp(Player, 676, 7, 5)
	End If
Else
	PlayerWarp(Player, 676, 7, 7)
End If

End Sub