Function Main(Player as Long) AS LONG

PlayerMessage(Player, "You open your present and...!", White)
TakeObj(Player, 483, 1)

Select Case Random(8)
	Case 0
		GiveObj(Player, 482, 1)
		PlayerMessage(Player, "You got a Teddy!!", BrightGreen)
	Case 1
		GiveObj(Player, 54, 1)
		PlayerMessage(Player, "You got a Jester's Cap!", BrightGreen)
	Case 2
		GiveObj(Player, 49, 1)
		PlayerMessage(Player, "You got some Champagne!", BrightGreen)
	Case 3
		GiveObj(Player, 114, 1)
		PlayerMessage(Player, "You got a Caramel Chew!", BrightGreen)
	Case 4
		GiveObj(Player, 48, 1)
		PlayerMessage(Player, "You got some Sushi!", BrightGreen)
	Case 5
		GiveObj(Player, 31, 1)
		GiveObj(Player, 233, 20)
		PlayerMessage(Player, "You got a Crossbow and Bolts!", BrightGreen)
	Case 6
		GiveObj(Player, 373, 1)
		PlayerMessage(Player, "You got a Warlord's Tunic!", BrightGreen)
	Case 7
		GiveObj(Player, 444, 1)
		PlayerMessage(Player, "You got some Fireworks!!", BrightGreen)
End Select
	CreatePlayerFloatText(Player, "!", BrightGreen)
	CreateCharacterEffect(GetPlayerMap(Player), Player, 45, 40, 8, 0, 0)
End Function