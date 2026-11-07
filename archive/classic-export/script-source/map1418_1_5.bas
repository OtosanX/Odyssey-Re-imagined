Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1418, 1, 6)
	Else
		PlayerWarp(Player, 1418, 2, 5)
	End If
Else
	PlayerWarp(Player, 1418, 2, 5)
End If

End Sub