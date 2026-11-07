Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "wish") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1715, 9, 7)
	Else
		PlayerWarp(Player, 1715, 9, 5)
	End If
Else
	PlayerWarp(Player, 1715, 9, 5)
End If

End Sub