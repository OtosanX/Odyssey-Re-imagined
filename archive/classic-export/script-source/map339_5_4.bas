Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 339, 6, 4)
	Else
		PlayerWarp(Player, 339, 4, 4)
	End If
Else
	PlayerWarp(Player, 339, 4, 4)
End If

End Sub