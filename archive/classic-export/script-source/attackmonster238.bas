Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(3)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "AHAHA!!", Green)
	Case 1
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "You think you can hurt me mortal?!", Green)
	Case 2
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "No one shall enter the Soul Prison", Green)
End Select
SetMonsterTarget(Map, 0, Player)
Main = Stop

End Function