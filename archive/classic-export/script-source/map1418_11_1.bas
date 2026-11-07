Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1418, 11, 0)
	Else
		PlayerWarp(Player, 1418, 11, 2)
	End If
Else
	PlayerWarp(Player, 1418, 11, 2)
End If

End Sub