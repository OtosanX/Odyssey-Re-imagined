Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 93) = 0 Then
	PlayerMessage(Player, "Alchemist says, ''Somethings missing... I can't put my finger on it... BUBRIE BEAK! Oh what I would give for a Bubrie Beak...''", Grey)
		If HasObj(Player, 307) Then
			SetPlayerFlag(Player, 93, 1)
			PlayerMessage(Player, "Alchemist says, ''Oh thank you so much adventurer! Finally the secrets of transmutation will be mine!''", Grey)
			PlayerMessage(Player, "You have completed the Alchemy Errand!", BrightGreen)
			TakeObj(Player, 307, 1)
			If GetPlayerLevel(Player) < 80 Then
				GivePlayerExp(Player, 3000)
				PlayerMessage(Player, "You have gained 3k experience!", Green)
			Else
				GiveObj(Player, 67, 30)
				PlayerMessage(Player, "You have received 30 Flowers!", Green)
			End If
		Exit Function
		End If
	Exit Function
Else
	PlayerMessage(Player, "Alchemist says, ''Welcome back adventurer, how may I help you?''", Grey)
End If

End Function