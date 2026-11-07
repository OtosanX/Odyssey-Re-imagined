Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(4)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "We've always plenty chicken to go around.", White)
	Case 1
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Come in, come in!", White)
	Case Else
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Would you like something to eat?", White)
End Select
Main = Stop

End Function