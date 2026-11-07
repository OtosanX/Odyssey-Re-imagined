Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "archmage") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1857, 1, 10)
	Else
		PlayerWarp(Player, 1857, 1, 8)
	End If
Else
	PlayerWarp(Player, 1857, 1, 8)
End If

End Sub