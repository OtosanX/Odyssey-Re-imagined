Function Main(Player as Long) AS LONG

If GetPlayerAccess(Player) = 0 Then
	SetFlag(93, 1)
	ResetMap(1489)
	PlayerMessage(Player, "You hear a voice say, ''You wish to learn of the Dark Arts? So be it.''", White)
	SpawnMonster(1489, 240, 5, 5, 0)
	Timer(Player, 20, "summonerfire")
End If

End Function