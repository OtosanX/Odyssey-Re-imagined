Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

Select Case Random(4)
	Case 0
		CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "May I suggest the soup, over your head...", White)
	Case Else
		If GetPlayerGender(Player) = 1 Then
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "May I take your order maam?", White)
		Else
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "May I take your order sir?", White)
		End If
End Select
Main = Stop

End Function