Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "baker") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1444, 7, 10)
	Else
		PlayerWarp(Player, 1444, 7, 8)
	End If
Else
	PlayerWarp(Player, 1444, 7, 8)
End If

End Sub