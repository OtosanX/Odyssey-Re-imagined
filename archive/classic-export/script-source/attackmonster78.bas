Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(6)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "I am THE best ninja ever.", White)
	Case 1
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Mon en!!", White)
	Case Else
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Dont think you want to do that.", White)
End Select
Main = Stop

End Function