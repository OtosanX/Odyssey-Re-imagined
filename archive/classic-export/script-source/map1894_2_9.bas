Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "awsq") | strcmp(GetPlayerUser(Player), "romeo") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1894, 1, 9)
	Else
		PlayerWarp(Player, 1894, 3, 9)
	End If
Else
	PlayerWarp(Player, 1894, 3, 9)
End If

End Sub