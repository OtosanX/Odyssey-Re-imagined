Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(4)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Of all the horrors, none as grave as your face.", White)
	Case Else
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Shop around, you won't find my wares!", White)
End Select
Main = Stop

End Function