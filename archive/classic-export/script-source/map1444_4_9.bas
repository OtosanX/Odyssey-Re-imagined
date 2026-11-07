Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "baker") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1444, 4, 10)
	Else
		PlayerWarp(Player, 1444, 4, 8)
	End If
Else
	PlayerWarp(Player, 1444, 4, 8)
End If

End Sub