Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "frankbob") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1888, 9, 4)
	Else
		PlayerWarp(Player, 1888, 9, 6)
	End If
Else
	PlayerWarp(Player, 1888, 9, 6)
End If

End Sub