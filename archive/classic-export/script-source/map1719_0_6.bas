Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Sting") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1719, 0, 7)
	Else
		PlayerWarp(Player, 1719, 0, 5)
	End If
Else
	PlayerWarp(Player, 1719, 0, 5)
End If

End Sub