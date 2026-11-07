Sub Main(Player AS LONG)
	Dim A AS LONG, Map AS LONG
	Dim X AS LONG, Y AS LONG
	Map = GetPlayerMap(Player)
	
	If Map = 0 Then Map = 623
	MapMessage(Map, "Mystic Duck Warriors - We must assess the human's strength to plan for our invasion.  ATTACK!!!", YELLOW)
	For A = 1 to 20
		X = Random(10) + 1
		Y = Random(10) + 1
		SpawnMonster(Map, 260, X, Y)
		CreateTileEffect(Map, X, Y, 2, 2, 8, 0, 0)
	Next A
End Sub