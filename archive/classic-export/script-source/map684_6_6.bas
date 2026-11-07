Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 684, 6, 5)
	Else
		PlayerWarp(Player, 684, 6, 7)
	End If
Else
	PlayerWarp(Player, 684, 6, 7)
End If

End Sub