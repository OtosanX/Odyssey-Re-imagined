Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "william9") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 706, 2, 4)
	Else
		PlayerWarp(Player, 706, 2, 6)
	End If
Else
	PlayerWarp(Player, 706, 2, 6)
End If

End Sub