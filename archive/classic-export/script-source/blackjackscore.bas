Sub Main(Player as Long)
dim Card as Long, Score as Long
Score = 0

For Card = 231 To 235
	If GetPlayerFlag(Player, Card) <> 1 Then
		If GetPlayerFlag(Player, Card) < 11 Then
			Score = Score + GetPlayerFlag(Player, Card)
		Else
			Score = Score + 10
		End If
	End If
Next Card
For Card = 231 To 235
	If GetPlayerFlag(Player, Card) = 1 Then
		If Score + 11 > 21 Then
			Score = Score + 1
		Else
			Score = Score + 11
		End If
	End If
Next Card

SetPlayerFlag(Player, 230, Score)
If Score > 21 Then RunScript1("BlackJackBust", Player)

End Sub