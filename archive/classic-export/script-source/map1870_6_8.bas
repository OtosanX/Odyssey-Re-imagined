Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "tyu") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1870, 6, 9)
	Else
		PlayerWarp(Player, 1870, 6, 7)
	End If
Else
	PlayerWarp(Player, 1870, 6, 7)
End If

End Sub