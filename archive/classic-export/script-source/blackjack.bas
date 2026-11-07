Sub Main(Player as Long)
dim Card1 as String, Card2 as String, Score as Long
Score = 0

SetPlayerFlag(Player, 231, Random(13) + 1)
SetPlayerFlag(Player, 232, Random(13) + 1)
Select Case GetPlayerFlag(Player, 231)
	Case 1
		Card1 = "Ace"
	Case 11
		Card1 = "Jack"
	Case 12
		Card1 = "Queen"
	Case 13
		Card1 = "King"
	Case Else
		Card1 = str(GetPlayerFlag(Player, 231))
End Select
Select Case GetPlayerFlag(Player, 232)
	Case 1
		Card2 = "Ace"
	Case 11
		Card2 = "Jack"
	Case 12
		Card2 = "Queen"
	Case 13
		Card2 = "King"
	Case Else
		Card2 = str(GetPlayerFlag(Player, 232))
End Select

RunScript1("BlackJackScore", Player)
PlayerMessage(Player, strcat("Your hand: ", strcat(Card1, strcat("  ", Card2))), White)
PlayerMessage(Player, "/Hit or /Stick?", Yellow)

End Sub