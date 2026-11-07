Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1890, 1, 2)
	Else
		PlayerWarp(Player, 1890, 1, 4)
	End If
Else
	PlayerWarp(Player, 1890, 1, 4)
End If

End Sub