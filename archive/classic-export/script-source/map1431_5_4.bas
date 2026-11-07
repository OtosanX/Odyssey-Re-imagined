Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Carrera") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1431, 5, 3)
	Else
		PlayerWarp(Player, 1431, 5, 5)
	End If
Else
	PlayerWarp(Player, 1431, 5, 5)
End If

End Sub