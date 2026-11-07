Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "sirspanksalot") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 705, 7, 2)
	Else
		PlayerWarp(Player, 705, 7, 4)
	End If
Else
	PlayerWarp(Player, 705, 7, 4)
End If

End Sub