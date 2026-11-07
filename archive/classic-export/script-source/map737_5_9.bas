Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Inviskill") | strcmp(GetPlayerUser(Player), "Samuel") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 737, 5, 10)
	Else
		PlayerWarp(Player, 737, 5, 8)
	End If
Else
	PlayerWarp(Player, 737, 5, 8)
End If

End Sub