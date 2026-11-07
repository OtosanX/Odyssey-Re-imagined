Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "baker") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1444, 8, 10)
	Else
		PlayerWarp(Player, 1444, 10, 10)
	End If
Else
	PlayerWarp(Player, 1444, 10, 10)
End If

End Sub