Sub Main(Player as Long)

PlayerWarp(Player, 624, 9, 6)

If HasObj(Player, 392) >= 5 Then
	TakeObj(Player, 392, 5)
	GiveObj(Player, 31, 1)
	GiveObj(Player, 233, 20)
	PlayerMessage(Player, "You trade 5 Game Tokens for a Crossbow & Bolts!", White)
Else
	PlayerMessage(Player, "You require 5 Game Tokens for this.", White)
End If

End Sub