Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1715, 3, 11)
	Else
		PlayerWarp(Player, 1715, 5, 11)
	End If
Else
	PlayerWarp(Player, 1715, 5, 11)
End If

End Sub