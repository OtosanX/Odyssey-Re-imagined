Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jeromeb") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 634, 3, 1)
	Else
		PlayerWarp(Player, 634, 5, 1)
	End If
Else
	PlayerWarp(Player, 634, 5, 1)
End If

End Sub