Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hennet2") | strcmp(GetPlayerUser(Player), "Desteen") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 695, 2, 2)
	Else
		PlayerWarp(Player, 695, 2, 4)
	End If
Else
	PlayerWarp(Player, 695, 2, 4)
End If

End Sub