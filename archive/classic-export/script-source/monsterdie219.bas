Function Main(Player as Long) AS LONG
dim Chance as Long, X as Long, Y as Long

Chance = Random(5)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

Select Case GetPlayerDirection(Player)
	Case Up
		Y = Y - 1
	Case Down
		Y = Y + 1
	Case Left
		X = X - 1
	Case Right
		X = X + 1
End Select

Select Case Chance
	Case 1
		SpawnObject(GetPlayerMap(Player), 448, 3, X, Y)
End Select

End Function