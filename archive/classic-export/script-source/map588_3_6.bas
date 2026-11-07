Sub Main(Player as Long)

PlayerWarp(Player, 588, 3, 7)
Select Case Random(3)
	Case 0
		PlayerMessage(Player, "You fell off the log, what a tool.", White)
	Case 1
		PlayerMessage(Player, "You fell off the log, a new high.", White)
	Case 2
		PlayerMessage(Player, "You fell off the log, I've heard its not that difficult.", White)
End Select

CreateTileEffect(588, 3, 6, 11, 40, 8, 0, 0)

End Sub