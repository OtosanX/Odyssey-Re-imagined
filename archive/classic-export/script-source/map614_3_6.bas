Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "musashiden") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 614, 3, 7)
	Else
		PlayerWarp(Player, 614, 3, 5)
	End If
Else
	PlayerWarp(Player, 614, 3, 5)
End If

End Sub