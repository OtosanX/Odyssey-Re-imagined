SUB Main(Player AS LONG)

	If GetPlayerStrength(Player) = 0 Then
		PlayerMessage(Player, "Type /train to spend stats points", White)
	End If
	
	If GetPlayerLevel(Player) > 10 Then
		PlayerWarp(Player, 679, 5, 11)
	End If
END SUB