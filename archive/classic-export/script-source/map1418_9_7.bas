Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1418, 9, 6)
	Else
		PlayerWarp(Player, 1418, 9, 8)
	End If
Else
	PlayerWarp(Player, 1418, 9, 8)
End If

End Sub