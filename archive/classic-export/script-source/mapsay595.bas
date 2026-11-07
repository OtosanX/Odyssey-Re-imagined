Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 240) = 0 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Ehh, ok...sir!''", Grey)
		PlayerMessage(Player, "Manny Farmer says, ''Good lad, now away you go.''", Yellow)
		SetPlayerFlag(Player, 240, 1)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Manners don't cost a thing.''", Grey)
		PlayerMessage(Player, "Manny Farmer says, ''Suit yerself.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 240) = 1 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'm on it.''", Grey)
		PlayerMessage(Player, "Manny Farmer says, ''Good lad, now away you go.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where was I meant to get the bucket from again?''", Grey)
		PlayerMessage(Player, "Manny Farmer says, ''Northcoast town, East of Dragonia. The Crafter there has made me one before.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If

End Function