Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 339, 10, 3)
	Else
		PlayerWarp(Player, 339, 10, 5)
	End If
Else
	PlayerWarp(Player, 339, 10, 5)
End If

End Sub