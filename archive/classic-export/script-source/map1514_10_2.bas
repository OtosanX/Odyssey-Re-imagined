Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1514, 10, 1)
	Else
		PlayerWarp(Player, 1514, 10, 3)
	End If
Else
	PlayerWarp(Player, 1514, 10, 3)
End If

End Sub