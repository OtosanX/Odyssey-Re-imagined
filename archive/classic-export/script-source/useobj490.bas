Sub Main(Player as Long)

TakeObj(Player, 490, 1)
CreatePlayerFloatText(Player, "BANG!", BrightGreen)
Select Case Random(9)
	Case 0
		SetPlayerSprite(Player, 15)
	Case 1
		SetPlayerSprite(Player, 56)
	Case 2
		SetPlayerSprite(Player, 71)
	Case 3
		SetPlayerSprite(Player, 78)
	Case 4
		SetPlayerSprite(Player, 103)
	Case 5
		SetPlayerSprite(Player, 113)
	Case 6
		SetPlayerSprite(Player, 183)
	Case 7
		SetPlayerSprite(Player, 204)
	Case 8
		SetPlayerSprite(Player, 205)
End Select

End Sub