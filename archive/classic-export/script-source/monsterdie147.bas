Function Main(Player as Long) AS LONG
dim Chance as Long, X as Long, Y as Long
'Recipe Scroll - Stout Potion

Chance = Random(5) + 1
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

Select Case Chance
	Case 1
		SpawnObject(GetPlayerMap(Player), 457, 1, X, Y)
End Select

End Function