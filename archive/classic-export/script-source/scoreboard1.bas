Sub Main(Player as Long)
dim Loop as Long

PlayerMessage(Player, "=Fire Catcher Scoreboard=", Yellow)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 225) > 0 Then
		If Loop <> Player Then
			PlayerMessage(Player, strcat(GetPlayerName(Loop), strcat(" - ", str(GetPlayerFlag(Loop, 225)))), Grey)
		End If
	End If
Next Loop

PlayerMessage(Player, strcat(GetPlayerName(Player), strcat(" - ", str(GetPlayerFlag(Player, 225)))), White)

End Sub