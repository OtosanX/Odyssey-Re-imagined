Function Main(Player as Long) AS LONG

SetPlayerFlag(Player, 11, 1)
SetPlayerSprite(Player, 1)
SetPlayerGuild(Player, 100)

Select Case Random(4)
	Case 0
		PlayerWarp(Player, 1421, 6, 5)
	Case 1
		PlayerWarp(Player, 1421, 5, 2)
	Case 2
		PlayerWarp(Player, 1421, 5, 8)
	Case 3
		PlayerWarp(Player, 1421, 2, 5)
End Select

End Function