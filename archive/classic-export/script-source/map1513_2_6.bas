Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1513, 2, 7)
	Else
		PlayerWarp(Player, 1513, 2, 5)
	End If
Else
	PlayerWarp(Player, 1513, 2, 5)
End If

End Sub