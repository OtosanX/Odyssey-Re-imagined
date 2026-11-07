Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sexyman") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 703, 10, 3)
	Else
		PlayerWarp(Player, 703, 10, 5)
	End If
Else
	PlayerWarp(Player, 703, 10, 5)
End If

End Sub