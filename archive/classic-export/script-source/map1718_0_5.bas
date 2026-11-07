Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sting") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1718, 0, 6)
	Else
		PlayerWarp(Player, 1718, 0, 4)
	End If
Else
	PlayerWarp(Player, 1718, 0, 4)
End If

End Sub