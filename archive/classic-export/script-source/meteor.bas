Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long, RangeX as Long, RangeY as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player) - 1
Y = GetPlayerY(Player) - 1


For RangeX = 1 To 3
For RangeY = 1 To 3
	If X = GetPlayerX(Player) & Y = GetPlayerY(Player) Then
	'Doesnt hit self
	Else
		If Random(2) = 1 Then
			CreateTileEffect(Map, X, Y, 63, 100, 3, 2, 0)
			CreateTileEffect(Map, X, Y, 23, 40, 2, 6, 0)
		End If
	End If
	Y = Y + 1
Next RangeY
	X = X + 1
	Y = GetPlayerY(Player) - 1
Next RangeX

End Sub