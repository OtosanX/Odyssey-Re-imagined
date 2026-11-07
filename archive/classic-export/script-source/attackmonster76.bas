Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(2)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Hm...", White)
	Case 1
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Hi.", White)
End Select
Main = Stop

End Function