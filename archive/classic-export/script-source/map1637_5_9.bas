SUB Main(Player AS LONG)
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	
	Else
		PlayerWarp(Player, 1637, 5, 8)
	End If
END SUB