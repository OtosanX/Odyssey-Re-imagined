Function Main(Player as Long) AS LONG

If GetPlayerFlag(Player, 91) = 0 Then
	PlayerMessage(Player, "Lumberjack says, ''Bah! My hatchet broke again... Any chance you could fetch me one?''", Grey)
		If HasObj(Player, 27) Then
			SetPlayerFlag(Player, 91, 1)
			PlayerMessage(Player, "Lumberjack says, ''Ahh! Just the ticket! You're my kind of guy!''", Grey)
			PlayerMessage(Player, "You have completed the Lumberjack Errand!", BrightGreen)
			TakeObj(Player, 27, 1)
			If GetPlayerLevel(Player) < 80 Then
				GivePlayerExp(Player, 1000)
				PlayerMessage(Player, "You have gained 1k experience!", Green)
			Else
				GiveObj(Player, 67, 10)
				PlayerMessage(Player, "You have received 10 Flowers!", Green)
			End If
		End If
Else
	PlayerMessage(Player, "Lumberjack says, ''Thanks again for the hatchet, it works a treat!''", Grey)
End If

End Function