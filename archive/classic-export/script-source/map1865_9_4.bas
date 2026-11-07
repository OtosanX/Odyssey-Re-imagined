Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "NaughtyMonki") | strcmp(GetPlayerUser(Player), "Endeavor") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 1865, 9, 3)
	Else
		PlayerWarp(Player, 1865, 9, 5)
	End If
Else
	PlayerWarp(Player, 1865, 9, 3)
End If

End Sub