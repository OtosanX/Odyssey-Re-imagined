Sub Main(Player as Long)
dim X as Long, Y as Long

If GetFlag(141) > 0 Then
	Select Case Random(9)
	Case 0
		X = 2
		Y = 2
		SetFlag(140, 1)
	Case 1
		X = 8
		Y = 2
		SetFlag(140, 2)
	Case 2
		X = 5
		Y = 3
		SetFlag(140, 3)
	Case 3
		X = 10
		Y = 4
		SetFlag(140, 4)
	Case 4
		X = 4
		Y = 5
		SetFlag(140, 5)
	Case 5
		X = 2
		Y = 6
		SetFlag(140, 6)
	Case 6
		X = 8
		Y = 6
		SetFlag(140, 7)
	Case 7
		X = 4
		Y = 8
		SetFlag(140, 8)
	Case 8
		X = 7
		Y = 9
		SetFlag(140, 9)
	End Select
		CreateTileEffect(1409, X, Y, 1, 40, 8, 0, 0)
		SetFlag(141, GetFlag(141) - 1)
		Timer(Player, 1, "Floor")
End If

End Sub