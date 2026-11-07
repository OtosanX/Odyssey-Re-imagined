Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "ignisdjinn") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 441, 2, 4)
	Else
		PlayerWarp(Player, 441, 2, 6)
	End If
Else
	PlayerWarp(Player, 441, 2, 6)
End If

End Sub