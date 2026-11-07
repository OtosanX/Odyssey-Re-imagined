Function Main(Player as Long, Message as String) AS LONG

If GetPlayerLevel(Player) >= 30 Then
	If GetPlayerFlag(Player, 92) = 0 Then
		If strcmp(Message, "1") Then
			PlayerMessage(Player, "You say, ''Of course, how can I help?''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Thank you kind sir. Recently I came across some quite interesting treasures, but this one piece has had me puzzled. Would you like to see?''", Yellow)
			PlayerMessage(Player, "1. Im always interested in treasure.", DarkGrey)
			PlayerMessage(Player, "2. I dont think you should be giving me valuables...", DarkGrey)
			SetPlayerFlag(Player, 92, 1)
			Main = Stop
			Exit Function
		End If
		If strcmp(Message, "2") Then
			PlayerMessage(Player, "You say, ''Im a very busy adventurer, leave me be.''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Oh, sorry to bother you.''", Yellow)
			Main = Stop
			Exit Function
		End If
	End If
	If GetPlayerFlag(Player, 92) = 1 Then
		If strcmp(Message, "1") Then
			PlayerMessage(Player, "You say, ''Im always interested in treasure.''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Here it is. Strange isnt it. I havent the faintest idea what it says. Luckily my good friend Cundi is a dab hand at deceiphering old languages, would you mind taking it to him?''", Yellow)
			PlayerMessage(Player, "1. Sure thing, where can I find him?", DarkGrey)
			PlayerMessage(Player, "2. On second thoughts, maybe Im not the one to do this.", DarkGrey)
			GiveObj(Player, 280, 1)
			SetPlayerFlag(Player, 92, 2)
			Main = Stop
			Exit Function
		End If
		If strcmp(Message, "2") Then
			PlayerMessage(Player, "You say, ''I dont think you should be giving me valuables...''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Maybe I'll reconsider.''", Yellow)
			SetPlayerFlag(Player, 92, 0)
			Main = Stop
			Exit Function
		End If
	End If
	If GetPlayerFlag(Player, 92) = 2 Then
		If strcmp(Message, "1") Then
			PlayerMessage(Player, "You say, ''Sure thing, where can I find him?''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Oh thank you! He lives in the highest part of the world, a grand magician of the name Cundi. Farewell''", Yellow)
			SetPlayerFlag(Player, 92, 3)
			Main = Stop
			Exit Function
		End If
		If strcmp(Message, "2") Then
			PlayerMessage(Player, "You say, ''On second thoughts, maybe Im not the one to do this.''", Grey)
			PlayerMessage(Player, "Ness Atoui says, ''Then I'll be having that back thank you.''", Yellow)
			TakeObj(Player, 280, 1)
			SetPlayerFlag(Player, 92, 0)
			Main = Stop
			Exit Function
		End If
	End If
	If GetPlayerFlag(Player, 92) = 3 Then
		If HasObj(Player, 280) = 0 Then
			If strcmp(Message, "1") Then
				PlayerMessage(Player, "You say, ''Eh, yes please...''", Grey)
				PlayerMessage(Player, "Ness Atoui says, ''Here you go, try to be more careful this time.''", Yellow)
				GiveObj(Player, 280, 1)
				Main = Stop
				Exit Function
			End If
			If strcmp(Message, "2") Then
				PlayerMessage(Player, "You say, ''Its ok, I have it in a safe place.''", Grey)
				PlayerMessage(Player, "Ness Atoui says, ''Fine, but please hurry.''", Yellow)
				Main = Stop
				Exit Function
			End If
		End If
	End If
End If

Main = Continue
End Function