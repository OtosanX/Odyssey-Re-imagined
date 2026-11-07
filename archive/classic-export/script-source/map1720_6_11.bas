 Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sting") | strcmp(GetPlayerUser(Player), "Revolutionar") | strcmp(GetPlayerUser(Player), "Scorpio") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1720, 6, 10)
	Else
		PlayerWarp(Player, 1720, 5, 11)
	End If
Else
	PlayerWarp(Player, 1720, 6, 10)
End If

End Sub