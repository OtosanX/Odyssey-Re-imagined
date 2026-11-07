Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1514, 7, 11)
	Else
		PlayerWarp(Player, 1514, 5, 11)
	End If
Else
	PlayerWarp(Player, 1514, 5, 11)
End If

End Sub