Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zak") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 704, 7, 8)
	Else
		PlayerWarp(Player, 704, 7, 6)
	End If
Else
	PlayerWarp(Player, 704, 7, 6)
End If

End Sub