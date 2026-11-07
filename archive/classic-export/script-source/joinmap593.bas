Sub Main(Player as Long)

If GetPlayerFlag(Player, 243) = 0 Then
	PlayerMessage(Player, "Sanctuary Wench says, ''Would you care to aid an old woman with her troubles?", Yellow)
	PlayerMessage(Player, "1. I'd be delighted.", DarkGrey)
	PlayerMessage(Player, "2. I have enough troubles of my own.", DarkGrey)
	Exit Sub
End If
If GetPlayerFlag(Player, 243) = 1 Then
	PlayerMessage(Player, "Sanctuary Wench says, ''Have you got that potion from Granny Gertrude yet?", Yellow)
	PlayerMessage(Player, "1. I'm on my way.", DarkGrey)
	PlayerMessage(Player, "2. Where can I find Babylon?", DarkGrey)
	Exit Sub
End If

PlayerMessage(Player, "Sanctuary Wench says, ''Greetings, type /Craft if you wish to see an example of my Meddlings.''", White)

End Sub