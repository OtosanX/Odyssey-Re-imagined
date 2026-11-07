Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "pick123") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1417, 6, 6)
	Else
		PlayerWarp(Player, 1417, 8, 6)
	End If
Else
	PlayerWarp(Player, 1417, 6, 6)
End If

End Sub