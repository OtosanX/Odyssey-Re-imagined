Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "s2000roja") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 626, 1, 2)
	Else
		PlayerWarp(Player, 626, 1, 4)
	End If
Else
	PlayerWarp(Player, 626, 1, 4)
End If

End Sub