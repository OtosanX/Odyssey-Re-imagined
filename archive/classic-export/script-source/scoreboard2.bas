Sub Main(Player as Long)
dim Loop as Long

PlayerMessage(Player, "=Snowball Tag Scoreboard=", Yellow)
For Loop = 1 To GetMaxUsers()
	If GetPlayerFlag(Loop, 227) > 0 Then
		If Loop <> Player Then
			PlayerMessage(Player, strcat(GetPlayerName(Loop), strcat(" - ", strcat(str(GetPlayerFlag(Loop, 226)), strcat("/", str(GetPlayerFlag(Loop, 227)))))), Grey)
		End If
	End If
Next Loop

PlayerMessage(Player, strcat(GetPlayerName(Player), strcat(" - ", strcat(str(GetPlayerFlag(Player, 226)), strcat("/", str(GetPlayerFlag(Player, 227)))))), White)

End Sub