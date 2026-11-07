Function Main(Player as Long, Message as String) as Long

If Strcmp(Message, "help") Then
	PlayerMessage(Player, "Type /market to browse how many items are in stock and how much each item will buy and sell for.", Grey)
	PlayerMessage(Player, "To buy items type /market buy <item> <ammount>, and /market sell <item> <ammount> to sell.", Grey)
	PlayerMessage(Player, "The item number is shown next to the item in the /market list.", Grey)
	PlayerMessage(Player, "To buy 7 lumber you would type /market buy 1 7. As 1 is the number for lumber, and 7 the ammount you wish to buy.", Grey)
	PlayerMessage(Player, "The last numbers in the list are the buy and sell price per item.", Grey)
	PlayerMessage(Player, "This means a buy/sell of 250/245 means for each item sold you will earn 245 gold, and each item costs 250 gold to buy.", Grey)
End If

Main = Continue

End Function