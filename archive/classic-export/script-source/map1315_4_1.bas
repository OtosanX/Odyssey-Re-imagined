Function Main(Player as Long) AS LONG

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	If GetMapPlayerCount(1489) = 0 Then
		PlayerWarp(Player, 1489, 5, 3)
		SetFlag(93, 1)
		ResetMap(1489)
		PlayerMessage(Player, "You hear a voice say, ''You wish to learn of the Dark Arts? So be it.''", White)
		SpawnMonster(1489, 240, 5, 5, 0)
		Timer(Player, 20, "summonerfire")
	Else
		PlayerMessage(Player, "Someone is already attempting the Summoners Challenge.", Grey)
		PlayerWarp(Player, 1315, 4, 2)
	End If
Else
	PlayerMessage(Player, "You should regenerate before attempting the Summoners Challenge.", Grey)
	PlayerWarp(Player, 1315, 4, 2)
End If

End Function