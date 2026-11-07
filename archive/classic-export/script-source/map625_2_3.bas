Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Trevor9") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 625, 2, 2)
	Else
		PlayerWarp(Player, 625, 2, 4)
	End If
Else
	PlayerWarp(Player, 625, 2, 4)
End If

End Sub