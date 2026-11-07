Sub Main(Player as Long)

If strcmp(GetPlayerUser(Player), "Waste") Then
	If GetPlayerDirection(Player) = Left Then
		PlayerWarp(Player, 682, 1, 2)
	Else
		PlayerWarp(Player, 682, 3, 2)
	End If
Else
	PlayerWarp(Player, 682, 3, 2)
End If

End Sub