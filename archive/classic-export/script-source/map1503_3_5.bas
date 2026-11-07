Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1503, 3, 4)
	Else
		PlayerWarp(Player, 1503, 3, 6)
	End If
Else
	PlayerWarp(Player, 1503, 3, 6)
End If

End Sub