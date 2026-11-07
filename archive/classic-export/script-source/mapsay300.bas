Function Main(Player as Long, Message as String) as Long

If GetPlayerFlag(Player, 240) = 1 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Why do you need 100 Lumber?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Because I'm not very good at buckets...''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I get these Metal Bands?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Speak to Garad the Crendale Blacksmith. He has made them to my specifications before.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 240) = 2 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Why do you need 100 Lumber?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Because I'm not very good at buckets...''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I get these Metal Bands?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Speak to Garad the Crendale Blacksmith. He has made them to my specifications before.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 240) = 3 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Why do you need 100 Lumber?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Because I'm not very good at buckets...''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I get these Metal Bands?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Speak to Garad the Crendale Blacksmith. He has made them to my specifications before.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 240) = 4 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''Why do you need 100 Lumber?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Because I'm not very good at buckets...''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''Where can I get these Metal Bands?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Speak to Garad the Crendale Blacksmith. He has made them to my specifications before.''", Yellow)
		Main = Stop
		Exit Function
	End If
End If
If GetPlayerFlag(Player, 240) = 5 Then
	If strcmp(Message, "1") Then
		PlayerMessage(Player, "You say, ''I'm just on my way now.''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Good job, he will be very pleased.''", Yellow)
		Main = Stop
		Exit Function
	End If
	If strcmp(Message, "2") Then
		PlayerMessage(Player, "You say, ''I lost the bucket... Can you make a new one for me?''", Grey)
		PlayerMessage(Player, "Madargan Gar says, ''Its a good thing I have the patience of a saint. Bring me the materials.''", Yellow)
		SetPlayerFlag(Player, 240, 2)
		Main = Stop
		Exit Function
	End If
End If

End Function