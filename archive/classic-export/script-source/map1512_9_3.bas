Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Maxwellwin") | strcmp(GetPlayerUser(Player), "Shawnee") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1512, 9, 2)
	Else
		PlayerWarp(Player, 1512, 9, 4)
	End If
Else
	PlayerWarp(Player, 1512, 9, 4)
End If

End Sub