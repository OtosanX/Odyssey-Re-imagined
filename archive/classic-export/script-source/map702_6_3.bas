Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 702, 6, 2)
	Else
		PlayerWarp(Player, 702, 6, 4)
	End If
Else
	PlayerWarp(Player, 702, 6, 4)
End If

End Sub