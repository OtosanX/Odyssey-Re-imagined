Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1885, 11, 2)
	Else
		PlayerWarp(Player, 1885, 11, 4)
	End If
Else
	PlayerWarp(Player, 1885, 11, 4)
End If

End Sub