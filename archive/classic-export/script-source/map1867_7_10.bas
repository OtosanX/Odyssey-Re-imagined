Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1867, 8, 10)
	Else
		PlayerWarp(Player, 1865, 10, 1)
	End If
Else
	PlayerWarp(Player, 1867, 6, 10)
End If

End Sub