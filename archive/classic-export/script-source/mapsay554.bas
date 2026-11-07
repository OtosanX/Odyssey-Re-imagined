Function Main(Player as Long, Message as String) as Long

If strcmp(Message, "help") Then
	PlayerMessage(Player, "=Secure Trading Rooms Help=", White)
	PlayerMessage(Player, "Stand on the correct tiles and type /barter <player>.", Yellow)
	PlayerMessage(Player, "Drop the items that are to be traded and stand on your blue tile. DO NOT drop items on the blue tiles.", Yellow)
	PlayerMessage(Player, "While on the blue tiles type /barter <player> again.", Yellow)
	PlayerMessage(Player, "Only the first person onto their tile may start the trade.", Yellow)
End If
Main = Continue

End Function