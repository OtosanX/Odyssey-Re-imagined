Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "baker") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1444, 3, 10)
	Else
		PlayerWarp(Player, 1444, 1, 10)
	End If
Else
	PlayerWarp(Player, 1444, 1, 10)
End If

End Sub