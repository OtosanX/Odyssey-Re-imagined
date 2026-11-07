Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Wish") | strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1876, 9, 3)
	Else
		PlayerWarp(Player, 1876, 9, 5)
	End If
Else
	PlayerWarp(Player, 1876, 9, 5)
End If

End Sub