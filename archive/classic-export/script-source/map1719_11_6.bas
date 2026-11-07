Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Revolutionar") | strcmp(GetPlayerUser(Player), "Scorpio") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1719, 11, 7)
	Else
		PlayerWarp(Player, 1719, 11, 5)
	End If
Else
	PlayerWarp(Player, 1719, 11, 5)
End If

End Sub