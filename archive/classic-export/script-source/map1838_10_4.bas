Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "ArchMage") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1838, 10, 3)
	Else
		PlayerWarp(Player, 1838, 10, 5)
	End If
Else
	PlayerWarp(Player, 1838, 10, 5)
End If

End Sub