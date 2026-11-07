Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "lax") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 630, 0, 6)
	Else
		PlayerWarp(Player, 630, 2, 6)
	End If
Else
	PlayerWarp(Player, 630, 2, 6)
End If

End Sub