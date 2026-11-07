Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1503, 9, 5)
	Else
		PlayerWarp(Player, 1503, 9, 3)
	End If
Else
	PlayerWarp(Player, 1503, 9, 3)
End If

End Sub