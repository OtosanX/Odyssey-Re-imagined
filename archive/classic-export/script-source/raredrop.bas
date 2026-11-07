Sub Main(Player as Long, Chance as Long, Object as Long)
Dim X as Long, Y as Long

X = GetPlayerX(Player)
Y = GetPlayerY(Player)
If GetPlayerDirection(Player) = Up Then Y = Y - 1
If GetPlayerDirection(Player) = Down Then Y = Y + 1 
If GetPlayerDirection(Player) = Left Then X = X - 1
If GetPlayerDirection(Player) = Right Then X = X + 1
If X < 0 | X > 11 Then X = GetPlayerX(Player)
If Y < 0 | Y > 11 Then Y = GetPlayerY(Player)
If GetTileAtt(GetPlayerMap(Player), X, Y) <> 0 Then
	X = GetPlayerX(Player)
	Y = GetPlayerY(Player)
End If

If Random(Chance) + 1 = 1 Then SpawnObject(GetPlayerMap(Player), Object, 1, X, Y)

End Sub