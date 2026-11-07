Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "frankbob") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1886, 5, 3)
	Else
		PlayerWarp(Player, 1886, 5, 5)
	End If
Else
	PlayerWarp(Player, 1886, 5, 5)
End If

End Sub