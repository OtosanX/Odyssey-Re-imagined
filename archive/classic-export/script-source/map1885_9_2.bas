Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1885, 9, 1)
	Else
		PlayerWarp(Player, 1885, 9, 3)
	End If
Else
	PlayerWarp(Player, 1885, 9, 3)
End If

End Sub