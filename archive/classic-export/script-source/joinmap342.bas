Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 92) < 3 Then SetPlayerFlag(Player, 92, 0)

If GetPlayerLevel(Player) >= 30 Then
	If GetPlayerFlag(Player, 92) = 0 Then
		PlayerMessage(Player, "Ness Atoui says, ''Ahh you look like quite a sturdy adventurer, would you mind sparing me some of your time?''", Yellow)
		PlayerMessage(Player, "1. Of course, how can I help?", DarkGrey)
		PlayerMessage(Player, "2. Im a very busy adventurer, leave me be.", DarkGrey)
		Exit Function
	End If
	If GetPlayerFlag(Player, 92) = 3 Then
		If HasObj(Player, 280) Then
			PlayerMessage(Player, "Ness Atoui says, ''How's the trip coming along? You haven't gotten far have you...''", Yellow)
		Exit Function
		End If
		If HasObj(Player, 280) = 0 Then
			PlayerMessage(Player, "Ness Atoui says, ''YOU LOST IT!?!? Good thing I knew you'd do that. Would you like another copy?", Yellow)
			PlayerMessage(Player, "1. Eh, yes please...", DarkGrey)
			PlayerMessage(Player, "2. Its ok, I have it in a safe place.", DarkGrey)
			Exit Function
		End If
	End If
	If GetPlayerFlag(Player, 92) = 4 Then
		If HasObj(Player, 281) Then
			PlayerMessage(Player, "Ness Atoui says, ''You made it!! Thank you so much adventurer! I don't know how to repay you, all these rubies wouldn't be enough, but I'm sure the deed is reward in itself for you.''", Yellow)
			PlayerMessage(Player, "You say, ''...''", Grey)
			TakeObj(Player, 281, 1)
			SetPlayerFlag(Player, 92, 5)
			PlayerMessage(Player, "You have completed the Gibberish Errand!", BrightGreen)
				If GetPlayerLevel(Player) < 80 Then
					GivePlayerExp(Player, 20000)
					PlayerMessage(Player, "You have gained 20k experience!", Green)
				Else
					GiveObj(Player, 6, 100000)
				PlayerMessage(Player, "You have received 100k Gold Coins!", Green)
				End If
			Exit Function
		End If
		If HasObj(Player, 281) = 0 Then
			PlayerMessage(Player, "Ness Atoui says, ''You met Cundi? But you lost the translation... Good game newb, go get another one.''", Yellow)
			Exit Function
		End If
	End If
	If GetPlayerFlag(Player, 92) > 4 Then
		PlayerMessage(Player, "Ness Atoui says, ''Welcome to Ness's Ruby Centre, bank of Dragonia''", Grey)	
	End If
Else
	PlayerMessage(Player, "Ness Atoui says, ''Welcome to Ness's Ruby Centre, bank of Dragonia''", Grey)
End If

End Function