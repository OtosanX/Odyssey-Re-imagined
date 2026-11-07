Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Trevor9") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 683, 3, 6)
	Else
		PlayerWarp(Player, 683, 3, 4)
	End If
Else
	PlayerWarp(Player, 683, 3, 4)
End If

End Sub