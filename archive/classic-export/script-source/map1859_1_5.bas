Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "archmage") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1859, 1, 6)
	Else
		PlayerWarp(Player, 1859, 1, 4)
	End If
Else
	PlayerWarp(Player, 1859, 1, 4)
End If

End Sub