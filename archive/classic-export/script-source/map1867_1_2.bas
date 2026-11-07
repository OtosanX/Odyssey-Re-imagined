Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1867, 2, 2)
	Else
		PlayerWarp(Player, 1867, 0, 2)
	End If
Else
	PlayerWarp(Player, 1867, 0, 2)
End If

End Sub