Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 635, 5, 6)
	Else
		PlayerWarp(Player, 635, 5, 8)
	End If
Else
	PlayerWarp(Player, 635, 5, 8)
End If

End Sub