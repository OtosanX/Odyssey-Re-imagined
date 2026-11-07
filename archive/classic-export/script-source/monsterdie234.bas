Function Main(Player as Long) AS LONG
dim Chance as Long, X as Long, Y as Long

Chance = Random(4) + 1
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
	If GetPlayerDirection(Player) = 0 Then Y = Y - 1
	If GetPlayerDirection(Player) = 1 Then Y = Y + 1
	If GetPlayerDirection(Player) = 2 Then X = X - 1
	If GetPlayerDirection(Player) = 3 Then X = X + 1
If X < 0 | X > 11 Then Exit Function
If Y < 0 | Y > 11 Then Exit Function

Select Case Chance
	Case 1
		SpawnObject(GetPlayerMap(Player), 53, 1, X, Y)
	Case 2
		SpawnObject(GetPlayerMap(Player), 56, 1, X, Y)
	Case 3
		SpawnObject(GetPlayerMap(Player), 59, 1, X, Y)
	Case 4
		SpawnObject(GetPlayerMap(Player), 120, 1, X, Y)
End Select

Main = Continue

End Function