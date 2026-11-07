Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Jeromeb") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1895, 1, 10)
	Else
		PlayerWarp(Player, 1895, 3, 10)
	End If
Else
	PlayerWarp(Player, 1895, 3, 10)
End If

End Sub