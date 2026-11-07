Sub Main(Player as Long)

If GetPlayerFlag(Player, 13) < 4 Then
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1949, 8, 1)
	Else
		PlayerWarp(Player, 1949, 9, 2)
	End If
Else
	If GetPlayerDirection(Player) = Right Then
		PlayerWarp(Player, 1949, 9, 2)
	Else
		PlayerWarp(Player, 1949, 11, 7)
		SetPlayerFlag(Player, 13, 0)
		RunScript1("Restore", Player)
		SetFlag(150, 0)
		MapMessage(1949, "A new duel may now begin.", Yellow)
	End If
End If

End Sub