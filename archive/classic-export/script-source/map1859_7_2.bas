Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "archmage") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1859, 7, 1)
	Else
		PlayerWarp(Player, 1859, 7, 3)
	End If
Else
	PlayerWarp(Player, 1859, 7, 3)
End If

End Sub