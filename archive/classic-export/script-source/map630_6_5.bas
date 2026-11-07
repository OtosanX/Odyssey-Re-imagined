Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 630, 7, 5)
	Else
		PlayerWarp(Player, 630, 5, 5)
	End If
Else
	PlayerWarp(Player, 630, 5, 5)
End If

End Sub