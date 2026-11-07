Function Main(Player as Long) AS LONG

SetPlayerFlag(Player, 11, 2)
SetPlayerSprite(Player, 7)
SetPlayerGuild(Player, 101)

Select Case Random(4)
	Case 0
		PlayerWarp(Player, 1422, 5, 5)
	Case 1
		PlayerWarp(Player, 1422, 6, 2)
	Case 2
		PlayerWarp(Player, 1422, 6, 8)
	Case 3
		PlayerWarp(Player, 1422, 9, 5)
End Select

End Function
	