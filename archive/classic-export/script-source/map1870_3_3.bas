Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "tyu") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1870, 3, 2)
	Else
		PlayerWarp(Player, 1870, 3, 4)
	End If
Else
	PlayerWarp(Player, 1870, 3, 4)
End If

End Sub