Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 240) = 2 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I am in need of some Metal Bands for a bucket. Madargan said you'd still have the diamentions from last time.''", Grey)
		PlayerMessage(Player, "Garad says, ''Very well, bring me 3 Smelted Metals and I shall get to work.''", Yellow)
		SetPlayerFlag(Player, 240, 3)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''How do I make Smelted Metal?''", Grey)
		PlayerMessage(Player, "Garad says, ''Take Ore that you have mined to my Forge in the back of this room.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 240) = 3 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'll have the Smelted Metal ready soon.''", Grey)
		PlayerMessage(Player, "Garad says, ''Very well, remember that I require 3 Metals.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''How do I make Smelted Metal?''", Grey)
		PlayerMessage(Player, "Garad says, ''Take Ore that you have mined to my Forge in the back of this room.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If

If GetPlayerFlag(Player, 240) = 4 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Where does he live again?''", Grey)
		PlayerMessage(Player, "Garad says, ''Madargan Gar lives in Northcoast, North of here and to the East of Dragonia.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''I lost those Metal Bands...''", Grey)
		PlayerMessage(Player, "Garad says, ''Not a very good adventurer are you... Bring me more Metals''", Yellow)
		SetPlayerFlag(Player, 240, 3)
		Main = Stop
		Exit Function
	End If
End If

End Function