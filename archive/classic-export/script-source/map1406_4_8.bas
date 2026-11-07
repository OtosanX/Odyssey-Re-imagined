Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Excel") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1406, 3, 8)
	Else
		PlayerWarp(Player, 1406, 5, 8)
	End If
Else
	PlayerWarp(Player, 1406, 5, 8)
End If

End Sub