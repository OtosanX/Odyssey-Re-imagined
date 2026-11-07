Sub Main(Player as Long, Parm1 as Long)
dim Map as Long
Map = GetPlayerMap(Player)

If Map <> 1960 & Map <> 1962 & Map <> 1414 & Map <> 1949 & Map <> 554 Then
	PlayerMessage(Player, "This is not an arena.", Grey)
	Exit Sub
End If

Select Case Parm1
Case 0
	PlayerMessage(Player, "Which part of the House of <PK> would you like to know more about?", White)
	PlayerMessage(Player, "1. FFA Arena", Grey)
	PlayerMessage(Player, "2. Duel Arena", Grey)
	PlayerMessage(Player, "3. Stake Arena", Grey)
	PlayerMessage(Player, "4. Team Arena", Grey)
	PlayerMessage(Player, "5. Trading Room", Grey)
Case 1
	PlayerMessage(Player, "==FFA Arena==", Yellow)
	PlayerMessage(Player, "In this arena anything goes.", Grey)
	PlayerMessage(Player, "Any number of people can enter/exit the arena at any time.", Grey)
Case 2
	PlayerMessage(Player, "==Duel Arena==", Yellow)
	PlayerMessage(Player, "The duel arena allows two people to duel without interuption.", Grey)
	PlayerMessage(Player, "Two players stand on the tiles at the top and one types /duel <name>.", Grey)
	PlayerMessage(Player, "This warps the players into the arena, where they fight until one is dead.", Grey)
	PlayerMessage(Player, "When there is a winner they are both warped out and a new duel can begin.", Grey)
Case 3
	PlayerMessage(Player, "==Stake Arena==", Yellow)
	PlayerMessage(Player, "The stake arena allows you to bet items in a duel.", Grey)
	PlayerMessage(Player, "Two players stand on the brown tiles at the side of the arena. One types /duel <name> and they are warped up.", Grey)
	PlayerMessage(Player, "Both players drop items of their choice on the tiles next to the arena.", Grey)
	PlayerMessage(Player, "When happy with the stake stand on the green tiles. First player on types /duel <name>.", Grey)
	PlayerMessage(Player, "When a player dies he is warped below, while the winner is warped to the items at the top.", Grey)
	PlayerMessage(Player, "Once the winner has taken the items and warped down from the fire a new duel can begin.", Grey)
	PlayerMessage(Player, "The same anti-scamming system is used here as is in the Trade Room. Look for help on the Trade Room for more info.", Grey)
Case 4
	PlayerMessage(Player, "==Team Arena==", Yellow)
	PlayerMessage(Player, "The team arena allows many people to fight together regardless of what guild they belong to.", Grey)
	PlayerMessage(Player, "To join a team simply run onto their team tile. To leave run into the team warp.", Grey)
	PlayerMessage(Player, "To start the fight, two players from each team must be standing on the start tiles at the top.", Grey)
	PlayerMessage(Player, "When there are enough players to start the fight type /teamarena.", Grey)
	PlayerMessage(Player, "There must be two players on each team, but there is no maximum number of players.", Grey)
	PlayerMessage(Player, "When one team is completely dead all players are warped down and a new duel can begin.", Grey)
Case 5
	PlayerMessage(Player, "==Secure Trade Room==", Yellow)
	PlayerMessage(Player, "Here items can be traded between players without any chance of being ripped off.", Grey)
	PlayerMessage(Player, "Two players stand on the start tiles and one type /barter <name>.", Grey)
	PlayerMessage(Player, "They are then warped up where they drop what they wish to trade on the floor.", Grey)
	PlayerMessage(Player, "The first person onto their blue tile starts the trade.", Grey)
	PlayerMessage(Player, "This is to ensure that no one can change the trade and then initiate it without the others concent.", Grey)
	PlayerMessage(Player, "Items are then taken a players warp out so that a new trade can begin.", Grey)
	PlayerMessage(Player, "NOTE: DO NOT drop items on blue tiles. DO NOT trade with someone who drops items on the blue tiles. DO NOT leave without your items for any reason. DO NOT trade without clicking the items you are receiving.", Yellow)
Case Else
	PlayerMessage(Player, "That is not a valid option.", Grey)
End Select

End Sub