Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jeromeb") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 634, 8, 1)
	Else
		PlayerWarp(Player, 634, 6, 1)
	End If
Else
	PlayerWarp(Player, 634, 6, 1)
End If

End Sub