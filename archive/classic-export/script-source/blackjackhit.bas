Sub Main(Player as Long)
dim Card1 as String, Card2 as String, Card3 as String, Card4 as String, Card5 as String

If GetPlayerFlag(Player, 233) = 0 Then
	SetPlayerFlag(Player, 233, Random(13) + 1)
	RunScript1("BlackJackScore", Player)
Else
	If GetPlayerFlag(Player, 234) = 0 Then
		SetPlayerFlag(Player, 234, Random(13) + 1)
		RunScript1("BlackJackScore", Player)
	Else
		If GetPlayerFlag(Player, 235) = 0 Then
			SetPlayerFlag(Player, 235, Random(13) + 1)
			RunScript1("BlackJackScore", Player)
		Else
			'Win
		End If
	End If
End If
If GetPlayerFlag(Player, 230) > 21 Then Exit Sub

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
Select Case GetPlayerFlag(Player, 233)
	Case 0
		Card3 = ""
	Case 1
		Card3 = "Ace"
	Case 11
		Card3 = "Jack"
	Case 12
		Card3 = "Queen"
	Case 13
		Card3 = "King"
	Case Else
		Card3 = str(GetPlayerFlag(Player, 233))
End Select
Select Case GetPlayerFlag(Player, 234)
	Case 0
		Card4 = ""
	Case 1
		Card4 = "Ace"
	Case 11
		Card4 = "Jack"
	Case 12
		Card4 = "Queen"
	Case 13
		Card4 = "King"
	Case Else
		Card4 = str(GetPlayerFlag(Player, 234))
End Select
Select Case GetPlayerFlag(Player, 235)
	Case 0
		Card5 = ""
	Case 1
		Card5 = "Ace"
	Case 11
		Card5 = "Jack"
	Case 12
		Card5 = "Queen"
	Case 13
		Card5 = "King"
	Case Else
		Card5 = str(GetPlayerFlag(Player, 235))
End Select

PlayerMessage(Player, strcat("Your hand: ", strcat(Card1, strcat("  ", strcat(Card2, strcat("  ", strcat(Card3, strcat("  ", strcat(Card4, strcat("  ", Card5))))))))), White)
PlayerMessage(Player, "/Hit or /Stick?", Yellow)

End Sub