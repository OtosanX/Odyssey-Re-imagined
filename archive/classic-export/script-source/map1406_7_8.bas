Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1406, 8, 8)
	Else
		PlayerWarp(Player, 1406, 6, 8)
	End If
Else
	PlayerWarp(Player, 1406, 6, 8)
End If

End Sub