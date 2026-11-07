Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sexyman") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 703, 10, 6)
	Else
		PlayerWarp(Player, 703, 10, 8)
	End If
Else
	PlayerWarp(Player, 703, 10, 6)
End If

End Sub