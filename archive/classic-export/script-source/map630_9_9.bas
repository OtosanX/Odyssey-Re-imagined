Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 630, 9, 8)
	Else
		PlayerWarp(Player, 630, 9, 10)
	End If
Else
	PlayerWarp(Player, 630, 9, 10)
End If

End Sub