Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long, X2 as Long, Y2 as Long
dim Loop as Long

If GetPlayerFlag(Player, 10) <> 11 Then
	PlayerMessage(Player, "You may only use this is Football.", Grey)
	Exit Sub
End If

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

Select Case GetPlayerDirection(Player)
	Case Up
		Y = Y - 1
		Y2 = Y - 1
	Case Down
		Y = Y + 1
		Y2 = Y + 1
	Case Left
		X = X - 1
		X2 = X - 1
	Case Right
		X = X + 1
		X2 = X + 1
End Select

If GetObjX(Map, 0) = X & GetObjY(Map, 0) = Y Then
	ResetMap(Map)
	SpawnObject(Map, 282, 1, GetPlayerX(Player), GetPlayerY(Player))
End If
If GetObjX(Map, 1) = X & GetObjY(Map, 1) = Y Then
	ResetMap(Map)
	SpawnObject(Map, 282, 1, GetPlayerX(Player), GetPlayerY(Player))
End If

For Loop = 1 To GetMaxUsers()
	If GetPlayerMap(Loop) = Map Then
	If GetPlayerX(Loop) = X Then
	If GetPlayerY(Loop) = Y Then
		If GetTileAtt(Map, X2, Y2) = 0 Then
			PlayerWarp(Loop, Map, X2, Y2)
			MapMessage(Map, strcat(GetPlayerName(Player), strcat(" tackles ", GetPlayerName(Loop))), Grey)
		End If
	End If
	End If
	End If
Next Loop

End Sub