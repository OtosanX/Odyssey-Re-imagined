Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1867, 7, 2)
	Else
		PlayerWarp(Player, 1867, 6, 1)
	End If
Else
	PlayerWarp(Player, 1867, 6, 1)
End If

End Sub