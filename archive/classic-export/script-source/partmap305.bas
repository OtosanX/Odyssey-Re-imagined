SUB Main(Player AS LONG)
	If GetMapPlayerCount(305) = 1 Then
		SetFlag(40, 0)
	End If
	
	If GetPlayerStatus(Player) = 9 Then SetPlayerStatus(Player, 0)
	If GetPlayerSprite(Player) = 255 Then SetPlayerSprite(Player, 0)
END SUB

