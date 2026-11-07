Sub Main(Player as Long, Target as Long)

Select Case GetPlayerFlag(Player, 17)
	Case 0
		RunScript2("TradeWarp2", Player, Target)
	Case 1
		PlayerMessage(Player, "Only the first player onto their tile may start the trade.", Grey)
	Case 2
		RunScript2("TradeWarp3", Player, Target)
End Select

End Sub