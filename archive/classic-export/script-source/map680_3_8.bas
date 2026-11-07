Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "citrus") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 680, 2, 8)
	Else
		PlayerWarp(Player, 680, 4, 8)
	End If
Else
	PlayerWarp(Player, 680, 4, 8)
End If

End Sub