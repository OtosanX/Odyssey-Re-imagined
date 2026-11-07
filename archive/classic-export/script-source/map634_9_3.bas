Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jeromeb") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 634, 9, 2)
	Else
		PlayerWarp(Player, 634, 9, 4)
	End If
Else
	PlayerWarp(Player, 634, 9, 4)
End If

End Sub