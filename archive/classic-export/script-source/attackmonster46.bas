Function Main(Player as LONG) AS LONG
dim Map as Long
Map = GetPlayerMap(Player)

If GetPlayerGuild(Player) = 0 Then
	Select Case Random(4)
		Case 0
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "How does Dragonia treat you?", White)
		Case Else
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Welcome to my Kingdom.", White)
	End Select
Else
	Select Case Random(4)
		Case 0
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "I have no time for Guilds.", White)
		Case Else
			CreateMapFloatText(Map, GetMonsterX(Map, 0), GetMonsterY(Map, 0), "Be off barbarian.", White)
	End Select
End If
Main = Stop

End Function