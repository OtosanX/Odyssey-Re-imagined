Sub Main(Player as Long)

If GetPlayerFlag(Player, 240) < 2 Then PlayerMessage(Player, "Garad says, ''The furance can smelt your ores, then type /smith to see what I can make.''", White)
If GetPlayerFlag(Player, 240) = 2 Then
	PlayerMessage(Player, "Garad says, ''How can I help you adventurer.''", Yellow)
	PlayerMessage(Player, "1. I am in need of some Metal Bands for a bucket. Madargan said you'd still have the diamentions from last time.", DarkGrey)
	PlayerMessage(Player, "2. How do I made Smelted Metal?", DarkGrey)
End If
If GetPlayerFlag(Player, 240) = 3 Then
	If HasObj(Player, 221) >= 3 Then
		PlayerMessage(Player, "Garad says, ''Ahh you brought the Smelted Metal. Hold on while I shape them into Metals Bands for you.''", Yellow)
		TakeObj(Player, 221, 3)
		GiveObj(Player, 461, 2)
		PlayerMessage(Player, "Garad says, ''Take these to Madargan Gar the Northcoast Crafter.''", Yellow)
		SetPlayerFlag(Player, 240, 4)
	Else
		PlayerMessage(Player, "Garad says, ''Did you get that Smelted Metal yet?''", Yellow)
		PlayerMessage(Player, "1. I'll have the Smelted Metal ready soon.", DarkGrey)
		PlayerMessage(Player, "2. How do I make Smelted Metal?", DarkGrey)
	End If
End If
If GetPlayerFlag(Player, 240) = 4 Then
	PlayerMessage(Player, "Garad says, ''Did you take those Metal Bands to Madargan Gar?''", Yellow)
	PlayerMessage(Player, "1. Where does he live again?", DarkGrey)
	PlayerMessage(Player, "2. I lost those Metal Bands...", DarkGrey)
End If

End Sub