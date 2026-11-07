Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "metgatchh") | strcmp(GetPlayerUser(Player), "myname") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1884, 8, 3)
	Else
		PlayerWarp(Player, 1884, 7, 4)
	End If
Else
	PlayerWarp(Player, 1884, 7, 4)
End If

End Sub