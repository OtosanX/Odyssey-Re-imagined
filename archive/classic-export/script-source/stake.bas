Sub Main(Player as Long, Target as Long)

Select Case GetPlayerFlag(Player, 13)
	Case 0
		RunScript2("stakewarp", Player, Target)
	Case 1
		PlayerMessage(Player, "You may not start the duel.", Grey)
	Case 2
		RunScript2("stakewarp2", Player, Target)
End Select

End Sub