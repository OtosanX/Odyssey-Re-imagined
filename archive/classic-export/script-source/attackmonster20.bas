Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

If Map = 55 Then
	Select Case Random(6)
		Case 0
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "My pond is sparkly.", White)
		Case 1
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "My friend lives far away under a castle.", White)
		Case Else
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Will you be my friend?", White)
	End Select
	Main = Stop
Else
	Main = Continue
End If

End Function