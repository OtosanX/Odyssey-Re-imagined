Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sting") | strcmp(GetPlayerUser(Player), "Revolutionar") | strcmp(GetPlayerUser(Player), "Scorpio") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1718, 11, 6)
	Else
		PlayerWarp(Player, 1718, 11, 4)
	End If
Else
	PlayerWarp(Player, 1718, 11, 4)
End If

End Sub