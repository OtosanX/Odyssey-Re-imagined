Function Main(Player as Long) as Long
dim A as Long, X as Long, Y as Long

A = Random(30) + 1
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerDirection(Player) = Up Then Y = Y - 1 
If GetPlayerDirection(Player) = Down Then Y = Y + 1 
If GetPlayerDirection(Player) = Left Then X = X - 1
If GetPlayerDirection(Player) = Right Then X = X + 1

Select Case A
	Case 1
		MapMessage(GetPlayerMap(Player), "The raider drops a Perfect Diamond!", White)
		SpawnObject(GetPlayerMap(Player), 434, 1, X, Y)
	Case 2
		MapMessage(GetPlayerMap(Player), "The raider drops a Shining Ruby!", White)
		SpawnObject(GetPlayerMap(Player), 435, 1, X, Y)
	Case 3
		MapMessage(GetPlayerMap(Player), "The raider drops a Clear Emerald!", White)
		SpawnObject(GetPlayerMap(Player), 441, 1, X, Y)
	Case 4
		MapMessage(GetPlayerMap(Player), "The raider drops a Bright Sapphire!", White)
		SpawnObject(GetPlayerMap(Player), 438, 1, X, Y)
	Case 5
		MapMessage(GetPlayerMap(Player), "The raider drops a Shined Amethyst!", White)
		SpawnObject(GetPlayerMap(Player), 458, 1, X, Y)
	Case 6
		MapMessage(GetPlayerMap(Player), "The raider drops a pile of gold!", White)
		SpawnObject(GetPlayerMap(Player), 6, 700, X, Y)
	Case 7
		MapMessage(GetPlayerMap(Player), "The raider drops a big pile of gold!", White)
		SpawnObject(GetPlayerMap(Player), 6, 1000, X, Y)
	Case 8
		MapMessage(GetPlayerMap(Player), "The raider drops a small pile of gold!", White)
		SpawnObject(GetPlayerMap(Player), 6, 400, X, Y)
	Case 9
		MapMessage(GetPlayerMap(Player), "The raider drops a huge pile of gold!", White)
		SpawnObject(GetPlayerMap(Player), 6, 2500, X, Y)
End Select

Main = Continue

End Function