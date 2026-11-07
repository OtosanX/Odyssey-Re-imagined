Sub Main(Player as Long)
dim X as Long, Y as Long, A as Long, B as Long
dim Loop as Long, Map as Long

If GetPlayerFlag(Player, 76) = 0 Then
	PlayerMessage(Player, "You must order this item from the Online Store.", White)
	Exit Sub
End If
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
		B = Y - 1
		A = X
		If Y < 1 Then Exit Sub
	Case Down
		Y = Y + 1
		B = Y + 1
		A = X
		If Y > 10 Then Exit Sub
	Case Left
		X = X - 1
		A = X - 1
		B = Y
		If X < 1 Then Exit Sub
	Case Right
		X = X + 1
		A = X + 1
		B = Y
		If X > 10 Then Exit Sub
End Select

For Loop = 1 to GetMaxUsers()
	If GetPlayerMap(Loop) = Map & GetPlayerX(Loop) = X & GetPlayerY(Loop) = Y Then
		If GetTileAtt(Map, A, B) = 0 Then PlayerWarp(Loop, Map, A, B)
	End If
Next Loop

End Sub