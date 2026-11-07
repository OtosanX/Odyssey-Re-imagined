Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "brandon") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 637, 6, 8)
	Else
		PlayerWarp(Player, 637, 6, 6)
	End If
Else
	PlayerWarp(Player, 637, 6, 6)
End If

End Sub