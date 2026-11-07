Function Main(Player as Long) as Long
dim Map as Long, X as Long, Y as Long, Dir as Long, Loop as Long, Ran as Long
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)
Ran = Random(2) + 1

For Loop = 1 To Ran
Select Case GetPlayerDirection(Player)
	Case Up
		Y = Y - 1
	Case Down
		Y = Y + 1
	Case Left
		X = X - 1
		If X < 0 Then
			If Map = 1423 Then
				Goto Backwards
			Else
				Map = Map - 1
				X = 11
			End If
		End If
	Case Right
		X = X + 1
		If X > 11 Then
			If Map = 1425 Then
				Goto Backwards
			Else
				Map = Map + 1
				X = 0
			End If
		End If
End Select

If GetTileAtt(Map, X, Y) = 11 Then	'Goal
	ResetMap(GetPlayerMap(Player))
	RunScript1("FootballWarp", Map)
	If GetPlayerFlag(Player, 11) = 1 Then
		RunScript2("FootballRedGoal", Player, Map)
	End If
	If GetPlayerFlag(Player, 11) = 2 Then
		RunScript2("FootballBlueGoal", Player, Map)
	End If
	Exit Function
End If
If GetTileAtt(Map, X, Y) = 0 Then
'	DestroyObject(GetPlayerMap(Player), 0)
'	DestroyObject(GetPlayerMap(Player), 1)
	ResetMap(GetPlayerMap(Player))
	ResetMap(Map)
	SpawnObject(Map, 282, 1, X, Y)
Else
Backwards:
	Select Case GetPlayerDirection(Player)
		Case Up
			Y = Y + 2
		Case Down
			Y = Y - 2
		Case Left
			X = X + 2
		Case Right
			X = X - 2
	End Select
	'DestroyObject(Map, 0)
	'DestroyObject(Map, 1)
	ResetMap(Map)
	SpawnObject(Map, 282, 1, X, Y)
	Exit Function
End If
Next Loop

End Function