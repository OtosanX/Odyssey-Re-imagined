Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "ville") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1871, 9, 3)
	Else
		PlayerWarp(Player, 1871, 9, 5)
	End If
Else
	PlayerWarp(Player, 1871, 9, 5)
End If

End Sub