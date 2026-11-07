Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1691, 6, 1)
	Else
		PlayerWarp(Player, 1691, 6, 3)
	End If
Else
	PlayerWarp(Player, 1691, 6, 3)
End If

End Sub