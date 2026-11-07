Sub Main(Player as Long)

If GetGuildHall(GetPlayerGuild(Player)) = 44 Then
	PlayerMessage(Player, "Marine Merchant says, ''My good man, would you care to travel to Northcoast? Free of charge of course.''", White)
Else
	PlayerMessage(Player, "Marine Merchant says, ''Would you care to travel to Northcoast? The trip will cost no more than 1k gold.''", Grey)
End If

End Sub