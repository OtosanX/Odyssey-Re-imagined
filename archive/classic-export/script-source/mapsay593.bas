Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 243) = 0 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'd be delighted.''", Grey)
		PlayerMessage(Player, "Sanctuary Wench says, ''Then let us begin. I am in need of a potion. The only one able to make this potion is Granny Gertrude. She lives just outside of the city of Babylon, to the East.''", Yellow)
		PlayerMessage(Player, "1. I'm on my way.", DarkGrey)
		PlayerMessage(Player, "2. Where can I find Babylon?", DarkGrey)
		SetPlayerFlag(Player, 243, 1)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''I have enough troubles of my own.''", Grey)
		PlayerMessage(Player, "Sanctuary Wench says, ''I have no use for your type anyway...''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 243) = 1 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'm on my way.''", Grey)
		PlayerMessage(Player, "Sanctuary Wench says, ''Return to me when you have the potion.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I find Babylon?''", Grey)
		PlayerMessage(Player, "Sanctuary Wench says, ''Babylon is to the East, North of the Tower, across the water.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If

End Function