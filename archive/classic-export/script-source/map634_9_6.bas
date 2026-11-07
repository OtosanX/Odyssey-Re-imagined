Sub Main(Player as Long)

If GetPlayerDirection(Player) = Down Then
	If strcmp(GetPlayerUser(Player), "Jeromeb") Then
		PlayerWarp(Player, 634, 9, 7)
	Else
		PlayerWarp(Player, 634, 9, 5)
	End If
Else
	If strcmp(GetPlayerUser(Player), "Jeromeb") Then
		PlayerWarp(Player, 634, 9, 5)
	Else
		PlayerWarp(Player, 634, 9, 7)
	End If
End If

End Sub