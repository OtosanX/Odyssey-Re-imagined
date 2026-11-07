Function Main(Player as Long) as Long

If GetPlayerFlag(Player, 210) = 1435 | GetPlayerFlag(Player, 210) = 1437 | GetPlayerFlag(Player, 210) = 1438 Then
	PlayerWarp(Player, 1, 5, 5)
Else
	PlayerWarp(Player, GetPlayerFlag(Player, 210), GetPlayerFlag(Player, 211), GetPlayerFlag(Player, 212))
End If
PlayerMessage(Player, "You return as if nothing ever happened.", White)

Select Case Random(3)
	Case 0
		GiveObj(Player, 153, 10)
		PlayerMessage(Player, "You find 10 Small Fish where the Water Sprite once stood!", White)
	Case 1
		GiveObj(Player, 152, 5)
		PlayerMessage(Player, "You find 5 Medium Fish where the Water Sprite once stood!", White)
	Case 2
		GiveObj(Player, 148, 2)
		PlayerMessage(Player, "You find 2 Big Fish where the Water Sprite once stood!", White)
End Select

End Function