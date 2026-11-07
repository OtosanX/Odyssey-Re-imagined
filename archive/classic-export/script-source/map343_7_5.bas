Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 343, 8, 5)
	Else
		PlayerWarp(Player, 343, 6, 5)
	End If
Else
	PlayerWarp(Player, 343, 6, 5)
End If

End Sub