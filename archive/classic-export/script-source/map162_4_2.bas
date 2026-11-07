Function Main(Player as Long) AS LONG

Select Case Random(6)
	Case 0
		PlayerWarp(Player, 162, 6, 2)
		PlayerMessage(Player, "You slip and fall down the gap...", White)
	Case Else
		PlayerWarp(Player, 162, 7, 2)
		PlayerMessage(Player, "You leap across the gap and land on the other side!", White)
End Select

End Function