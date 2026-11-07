Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Waste") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 625, 9, 2)
	Else
		PlayerWarp(Player, 625, 9, 4)
	End If
Else
	PlayerWarp(Player, 625, 9, 4)
End If

End Sub