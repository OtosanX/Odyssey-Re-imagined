Sub Main(Player as Long)
dim X as Long, Y as Long, Loop as Long, Winner as Long
Winner = 0

If GetFlag(139) > 0 Then
	Select Case Random(12)
	Case 0
		X = 2
		Y = 5
		SetFlag(140, 1)
	Case 1
		X = 2
		Y = 6
		SetFlag(140, 2)
	Case 2
		X = 3
		Y = 3
		SetFlag(140, 3)
	Case 3
		X = 3
		Y = 8
		SetFlag(140, 4)
	Case 4
		X = 5
		Y = 2
		SetFlag(140, 5)
	Case 5
		X = 5
		Y = 9
		SetFlag(140, 6)
	Case 6
		X = 6
		Y = 2
		SetFlag(140, 7)
	Case 7
		X = 6
		Y = 9
		SetFlag(140, 8)
	Case 8
		X = 8
		Y = 3
		SetFlag(140, 9)
	Case 9
		X = 8
		Y = 8
		SetFlag(140, 10)
	Case 10
		X = 9
		Y = 5
		SetFlag(140, 11)
	Case 11
		X = 9
		Y = 6
		SetFlag(140, 12)
	End Select
		CreateTileEffect(619, X, Y, 1, 40, 8, 0, 0)
		SetFlag(139, GetFlag(139) - 1)
		Timer(Player, 2, "SancGame1")
Else
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 15 Then
			PlayerWarp(Loop, 617, 5, 5)
			If GetPlayerFlag(Loop, 12) > Winner Then
				Winner = GetPlayerFlag(Loop, 12)
			End If
		End If
	Next Loop
	For Loop = 1 To GetMaxUsers()
		If GetPlayerFlag(Loop, 10) = 15 Then
			If GetPlayerFlag(Loop, 12) = Winner Then
				MapMessage(617, strcat(GetPlayerName(Loop), strcat(" wins Fire Catcher with ", strcat(str(Winner), "/20 points!"))), BrightGreen)
				SetPlayerFlag(Loop, 225, GetPlayerFlag(Loop, 225) + 1)
			End If
			SetPlayerFlag(Loop, 10, 0)
			SetPlayerFlag(Loop, 12, 0)
		End If
	Next Loop
End If

End Sub