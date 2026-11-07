Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "captainmarco") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1797, 6, 10)
	Else
		PlayerWarp(Player, 1797, 4, 10)
	End If
Else
	PlayerWarp(Player, 1797, 4, 10)
End If

End Sub