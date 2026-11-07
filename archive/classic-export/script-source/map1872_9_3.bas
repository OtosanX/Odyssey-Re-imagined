Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Kythos") | strcmp(GetPlayerUser(Player), "aws") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1872, 9, 2)
	Else
		PlayerWarp(Player, 1872, 9, 4)
	End If
Else
	PlayerWarp(Player, 1872, 9, 2)
End If

End Sub