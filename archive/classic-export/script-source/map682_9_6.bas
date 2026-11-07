Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Waste") Then
	If GetPlayerDirection(Player) = Up Then
		PlayerWarp(Player, 682, 9, 5)
	Else
		PlayerWarp(Player, 682, 9, 7)
	End If
Else
	PlayerWarp(Player, 682, 9, 7)
End If

End Sub