Sub Main(Player as Long)
dim X as Long, Y as Long, Z as Long
dim Loop as Long, Map as Long

If GetPlayerFlag(Player, 76) = 0 Then Exit Sub
If GetPlayerFlag(Player, 109) > 0 Then Exit Sub
If GetPlayerHP(Player) <> GetPlayerMaxHP(Player) Then
	PlayerMessage(Player, "You must have full Health to use Push.", Grey)
	Exit Sub
End If

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

SetPlayerFlag(Player, 109, 1)
Timer(Player, 6, "PushTimer")
MapMessage(GetPlayerMap(Player), StrCat(GetPlayerName(Player), " has used Push!"), BRIGHTRED)

Select Case GetPlayerDirection(Player)
	Case Up
		Y = Y - 1
		Z = Y - 1
		If Y < 1 Then Exit Sub
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
				If GetTileAtt(Map, X, Z) = 0 Then PlayerWarp(Loop, Map, X, Z)
			End If
		Next Loop
	Case Down
		Y = Y + 1
		Z = Y + 1
		If Y > 10 Then Exit Sub
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
				If GetTileAtt(Map, X, Z) = 0 Then PlayerWarp(Loop, Map, X, Z)
			End If
		Next Loop
	Case Left
		X = X - 1
		Z = X - 1
		If X < 1 Then Exit Sub
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
				If GetTileAtt(Map, Z, Y) = 0 Then PlayerWarp(Loop, Map, Z, Y)
			End If
		Next Loop
	Case Right
		X = X + 1
		Z = X + 1
		If X > 10 Then Exit Sub
		For Loop = 1 to GetMaxUsers()
			If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
				If GetTileAtt(Map, Z, Y) = 0 Then PlayerWarp(Loop, Map, Z, Y)
			End If
		Next Loop
End Select

End Sub