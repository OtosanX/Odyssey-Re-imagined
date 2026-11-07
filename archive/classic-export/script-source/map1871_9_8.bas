Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "ville") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1871, 9, 9)
	Else
		PlayerWarp(Player, 1871, 9, 7)
	End If
Else
	PlayerWarp(Player, 1871, 9, 7)
End If

End Sub