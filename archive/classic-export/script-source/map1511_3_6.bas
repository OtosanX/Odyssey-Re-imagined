Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Xantem") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1511, 3, 7)
	Else
		PlayerWarp(Player, 1511, 3, 5)
	End If
Else
	PlayerWarp(Player, 1511, 3, 5)
End If

End Sub