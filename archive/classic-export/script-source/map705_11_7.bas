Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "sirspanksalot") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 705, 11, 8)
	Else
		PlayerWarp(Player, 705, 11, 6)
	End If
Else
	PlayerWarp(Player, 705, 11, 6)
End If

End Sub