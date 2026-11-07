SUB Main(Player AS LONG)
	If GetPlayerGuild(Player) > 0 Then
		If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
			PlayerWarp(Player, 105, 6, 1)
		End If
	End If
END SUB