Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1512, 2, 2)
	Else
		PlayerWarp(Player, 1512, 2, 4)
	End If
Else
	PlayerWarp(Player, 1512, 2, 4)
End If

End Sub