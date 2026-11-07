SUB Main(Player AS LONG)
	If GetPlayerLevel(Player) < 30 Then
		PlayerMessage(Player, "You hear a loud scream and war drums coming from this passageway.  Best to try a different route!", WHITE)
		PlayerWarp(Player, 952, 8, 3)
	End If
END SUB