Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "musashiden") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 615, 5, 6)
	Else
		PlayerWarp(Player, 615, 5, 8)
	End If
Else
	PlayerWarp(Player, 615, 5, 8)
End If

End Sub