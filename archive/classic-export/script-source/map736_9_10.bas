Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Inviskill") | strcmp(GetPlayerUser(Player), "Samuel") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 736, 10, 10)
	Else
		PlayerWarp(Player, 736, 9, 9)
	End If
Else
	PlayerWarp(Player, 736, 9, 9)
End If

End Sub