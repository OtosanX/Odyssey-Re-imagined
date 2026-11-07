Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Chaos") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1504, 6, 2)
	Else
		PlayerWarp(Player, 1504, 6, 4)
	End If
Else
	PlayerWarp(Player, 1504, 6, 4)
End If

End Sub