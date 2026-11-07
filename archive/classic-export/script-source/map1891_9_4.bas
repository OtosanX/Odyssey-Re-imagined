Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Kythos") | strcmp(GetPlayerUser(Player), "aws") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1891, 9, 3)
	Else
		PlayerWarp(Player, 1891, 9, 5)
	End If
Else
	PlayerWarp(Player, 1891, 9, 5)
End If

End Sub