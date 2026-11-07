Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "metgatchh") | strcmp(GetPlayerUser(Player), "sonny") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1884, 11, 6)
	Else
		PlayerWarp(Player, 1884, 10, 6)
	End If
Else
	PlayerWarp(Player, 1884, 10, 6)
End If

End Sub