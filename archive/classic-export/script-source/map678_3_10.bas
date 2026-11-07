SUB Main(Player AS LONG)
	If GetPlayerEquipped(Player, 1) = 0 Then
		PlayerWarp(Player, 678, 3, 9)
		PlayerMessage(Player, "You must get your equipment before you proceed!", BRIGHTRED)
		Exit Sub
	End If
END SUB