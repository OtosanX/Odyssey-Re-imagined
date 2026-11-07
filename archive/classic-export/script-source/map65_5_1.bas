SUB Main(Player AS LONG)
	If GetPlayerAccess(Player) = 0 Then
		PlayerWarp(Player, 68, 5, 2)
	End If
END SUB