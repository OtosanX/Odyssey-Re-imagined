Sub Main(Player as Long)
dim X as Long, Y as Long

If GetMapPlayerCount(591) > 0 Then
	Select Case Random(4)+1
		Case 1
			X = 3
			Y = 3
		Case 2
			X = 10
			Y = 4
		Case 3
			X = 3
			Y = 8
		Case 4
			X = 8
			Y = 8
	End Select

	CreateTileEffect(591, X, Y, 1, 40, 8, 0, 0)
	CreateTileEffect(591, X, Y, 45, 40, 8, 1, 0)
	Timer(Player, 2, "SancFires")
End If

End Sub