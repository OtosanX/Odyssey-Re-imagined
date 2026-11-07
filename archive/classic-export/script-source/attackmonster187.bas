Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(3)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "God its cold in here...", White)
	Case Else
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Lay off I'm busy.", White)
End Select
Main = Stop

End Function