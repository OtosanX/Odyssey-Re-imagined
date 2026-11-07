Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "archmage") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1858, 6, 10)
	Else
		PlayerWarp(Player, 1858, 6, 8)
	End If
Else
	PlayerWarp(Player, 1858, 6, 8)
End If

End Sub