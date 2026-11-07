Function Main(Player as Long) AS LONG
dim Map as Long, X as Long, Y as Long
takeobj(player, 444, 1)
Map = GetPlayerMap(Player)

For X = 3 To 8
	For Y = 3 To 8
		If Random(3) = 0 Then
			CreateTileEffect(Map, X, Y, Random(70) + 1, 40 + Random(20), 8, Random(2), 0)
		End If
	Next Y
Next X

'If GetPlayerAccess(Player) = 0 Then
	'CreatePlayerFloatText(Player, "Fireworks!", BrightGreen)
	'TakeObj(Player, 444, 1)
'End If

End Function