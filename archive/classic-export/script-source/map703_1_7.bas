Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sexyman") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 703, 1, 6)
	Else
		PlayerWarp(Player, 703, 1, 8)
	End If
Else
	PlayerWarp(Player, 703, 1, 6)
End If

End Sub