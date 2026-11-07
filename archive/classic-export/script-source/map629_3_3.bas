Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 629, 2, 3)
	Else
		PlayerWarp(Player, 629, 4, 3)
	End If
Else
	PlayerWarp(Player, 629, 4, 3)
End If

End Sub