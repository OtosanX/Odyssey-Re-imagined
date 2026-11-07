Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 685, 2, 3)
	Else
		PlayerWarp(Player, 685, 2, 5)
	End If
Else
	PlayerWarp(Player, 685, 2, 5)
End If

End Sub