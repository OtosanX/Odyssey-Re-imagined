Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "JeromeB") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 684, 10, 9)
	Else
		PlayerWarp(Player, 684, 10, 7)
	End If
Else
	PlayerWarp(Player, 684, 10, 7)
End If

End Sub