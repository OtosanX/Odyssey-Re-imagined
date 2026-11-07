Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1715, 3, 10)
	Else
		PlayerWarp(Player, 1715, 5, 10)
	End If
Else
	PlayerWarp(Player, 1715, 5, 10)
End If

End Sub