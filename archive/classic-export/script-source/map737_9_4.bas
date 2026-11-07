Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Inviskill") | strcmp(GetPlayerUser(Player), "Samuel") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 737, 9, 3)
	Else
		PlayerWarp(Player, 737, 9, 5)
	End If
Else
	PlayerWarp(Player, 737, 9, 5)
End If

End Sub