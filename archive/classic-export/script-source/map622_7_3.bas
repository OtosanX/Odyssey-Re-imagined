Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Deathblow") | strcmp(GetPlayerUser(Player), "xxmegadethxx") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 622, 7, 2)
	Else
		PlayerWarp(Player, 622, 7, 4)
	End If
Else
	PlayerWarp(Player, 622, 7, 4)
End If

End Sub