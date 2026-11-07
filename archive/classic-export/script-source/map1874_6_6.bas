Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Kythos") | strcmp(GetPlayerUser(Player), "aws") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1874, 6, 5)
	Else
		PlayerWarp(Player, 1874, 6, 7)
	End If
Else
	PlayerWarp(Player, 1874, 6, 7)
End If

End Sub