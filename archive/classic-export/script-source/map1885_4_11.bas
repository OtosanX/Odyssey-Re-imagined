Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") | strcmp(GetPlayerUser(Player), "Jonhlilpunk") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1885, 3, 11)
	Else
		PlayerWarp(Player, 1885, 5, 11)
	End If
Else
	PlayerWarp(Player, 1885, 5, 11)
End If

End Sub