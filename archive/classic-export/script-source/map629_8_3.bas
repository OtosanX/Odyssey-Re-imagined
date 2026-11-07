Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 629, 9, 3)
	Else
		PlayerWarp(Player, 629, 7, 3)
	End If
Else
	PlayerWarp(Player, 629, 7, 3)
End If

End Sub