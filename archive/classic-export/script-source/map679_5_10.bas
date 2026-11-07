SUB Main(Player AS LONG)
	If GetPlayerLevel(Player) < 10 Then
		PlayerMessage(Player, "You must be level 10 to journey beyond this point!", BRIGHTRED)
		PlayerWarp(Player, 679, 8, 4)
	Else
		If GetPlayerLevel(Player) > 10 Then
			PlayerWarp(Player, 679, 5, 11)
			PlayerMessage(Player, "You are too strong for this area!", BRIGHTRED)
		End If
	End If
END SUB