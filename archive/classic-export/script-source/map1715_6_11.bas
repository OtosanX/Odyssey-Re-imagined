Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "wish") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1715, 7, 11)
	Else
		PlayerWarp(Player, 1715, 5, 11)
	End If
Else
	PlayerWarp(Player, 1715, 5, 11)
End If

End Sub