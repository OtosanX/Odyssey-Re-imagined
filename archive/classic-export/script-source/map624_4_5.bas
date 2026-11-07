Sub Main(Player as Long)

PlayerWarp(Player, 624, 4, 6)

If HasObj(Player, 392) >= 3 Then
	TakeObj(Player, 392, 3)
	GiveObj(Player, 114, 1)
	PlayerMessage(Player, "You trade 3 Game Tokens for a Caramel Chew!", White)
Else
	PlayerMessage(Player, "You require 3 Game Tokens for this.", White)
End If

End Sub