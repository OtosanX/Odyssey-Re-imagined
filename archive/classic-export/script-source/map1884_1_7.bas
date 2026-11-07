Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "metgatchh") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1884, 0, 6)
	Else
		PlayerWarp(Player, 1884, 1, 6)
	End If
Else
	PlayerWarp(Player, 1884, 1, 6)
End If

End Sub