Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "captainmarco") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1797, 10, 2)
	Else
		PlayerWarp(Player, 1797, 8, 2)
	End If
Else
	PlayerWarp(Player, 1797, 8, 2)
End If

End Sub