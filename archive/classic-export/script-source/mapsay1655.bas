Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 243) = 1 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Where can I get a Shaman's Amulet?''", Grey)
		PlayerMessage(Player, "Granny Gertrude says, ''There is only one way to get a Shaman's Amulet, kill a Troll Shaman using the sword of a noble. If you look under Lord Bob's house in Crendale you may find his Broadsword.''", Yellow)
		PlayerMessage(Player, "1. Where can I find the Broadsword?", DarkGrey)
		PlayerMessage(Player, "2. Where can I find the Troll Shaman?", DarkGrey)
		SetPlayerFlag(Player, 243, 2)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''That's a shame.''", Grey)
		PlayerMessage(Player, "Granny Gertrude says, ''Yes it is. If only you were of any use.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 243) = 2 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Where can I find the Broadsword?''", Grey)
		PlayerMessage(Player, "Granny Gertrude says, ''Look in the sewers below Lord Bob's House in Crendale. Last I heard he had flushed it down the toilet in a fit of rage.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I find the Troll Shaman?''", Grey)
		PlayerMessage(Player, "Granny Gertrude says, ''I know of one. He lives to the West of Crendale, hidden in a cave in the Draconis Ridge.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If

End Function