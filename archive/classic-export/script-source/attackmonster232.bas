Function Main(Player as Long) as Long
dim Map as Long

Map = GetPlayerMap(Player)
	Select Case Random(3)
		Case 0
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Do you wish to see my work?", White)
		Case Else
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "I meddle in many things", White)
	End Select
Main = Stop

End Function