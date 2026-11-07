Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") | strcmp(GetPlayerUser(Player), "Xin") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1433, 7, 4)
	Else
		PlayerWarp(Player, 1433, 7, 6)
	End If
Else
	PlayerWarp(Player, 1433, 7, 6)
End If

End Sub