Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Kinroto") Then
	If GetPlayerDirection(Player) = Down Then
		PlayerWarp(Player, 1697, 10, 7)
	Else
		PlayerWarp(Player, 1697, 10, 5)
	End If
Else
	PlayerWarp(Player, 1697, 10, 5)
End If

End Sub