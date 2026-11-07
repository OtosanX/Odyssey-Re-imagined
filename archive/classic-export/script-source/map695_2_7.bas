Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hennet2") | strcmp(GetPlayerUser(Player), "Desteen") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 695, 2, 8)
	Else
		PlayerWarp(Player, 695, 2, 6)
	End If
Else
	PlayerWarp(Player, 695, 2, 6)
End If

End Sub