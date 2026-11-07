Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1406, 4, 0)
	Else
		PlayerWarp(Player, 1406, 5, 2)
	End If
Else
	PlayerWarp(Player, 1406, 5, 2)
End If

End Sub