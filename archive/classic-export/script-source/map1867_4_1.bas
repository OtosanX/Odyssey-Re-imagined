Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 1867, 4, 2)
	Else
		PlayerWarp(Player, 1867, 5, 1)
	End If
Else
	PlayerWarp(Player, 1867, 5, 1)
End If

End Sub