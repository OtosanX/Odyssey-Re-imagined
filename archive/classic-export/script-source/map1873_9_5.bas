Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Kythos") | strcmp(GetPlayerUser(Player), "aws") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1873, 9, 6)
	Else
		PlayerWarp(Player, 1873, 9, 4)
	End If
Else
	PlayerWarp(Player, 1873, 9, 4)
End If

End Sub