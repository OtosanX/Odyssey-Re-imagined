Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Zak") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 704, 2, 2)
	Else
		PlayerWarp(Player, 704, 4, 2)
	End If
Else
	PlayerWarp(Player, 704, 4, 2)
End If

End Sub