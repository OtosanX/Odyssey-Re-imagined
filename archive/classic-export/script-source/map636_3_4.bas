Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 636, 3, 3)
	Else
		PlayerWarp(Player, 636, 3, 5)
	End If
Else
	PlayerWarp(Player, 636, 3, 5)
End If

End Sub