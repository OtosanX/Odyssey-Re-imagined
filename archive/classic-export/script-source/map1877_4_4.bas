Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "travisabrown") | strcmp(GetPlayerUser(Player), "jug") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1877, 4, 3)
	Else
		PlayerWarp(Player, 1877, 4, 5)
	End If
Else
	PlayerWarp(Player, 1877, 4, 5)
End If

End Sub