Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "ignisdjinn") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 441, 9, 4)
	Else
		PlayerWarp(Player, 441, 9, 6)
	End If
Else
	PlayerWarp(Player, 441, 9, 6)
End If

End Sub