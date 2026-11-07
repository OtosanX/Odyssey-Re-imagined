SUB Main(Player AS LONG)	

If GetPlayerGuild(Player) = 0 Then
	PlayerWarp(Player, 1675, 9, 11)
Else
	If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
		PlayerWarp(Player, 1675, 9, 11)
	Else
		PlayerWarp(Player, 108, 5, 2)
	End If
End If

END SUB