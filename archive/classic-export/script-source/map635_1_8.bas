Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 635, 1, 9)
	Else
		PlayerWarp(Player, 635, 1, 7)
	End If
Else
	PlayerWarp(Player, 635, 1, 7)
End If

End Sub