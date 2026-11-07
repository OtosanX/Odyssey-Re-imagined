Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Hyperlide") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1514, 6, 6)
	Else
		PlayerWarp(Player, 1514, 4, 6)
	End If
Else
	PlayerWarp(Player, 1514, 6, 6)
End If

End Sub