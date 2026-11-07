Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1878, 10, 2)
	Else
		PlayerWarp(Player, 1878, 10, 4)
	End If
Else
	PlayerWarp(Player, 1878, 10, 4)
End If

End Sub