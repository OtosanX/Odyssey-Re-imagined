Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Wish") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1895, 5, 2)
	Else
		PlayerWarp(Player, 1895, 5, 4)
	End If
Else
	PlayerWarp(Player, 1895, 5, 4)
End If

End Sub