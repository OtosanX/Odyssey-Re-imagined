Sub Main(Player as Long)

PlayerWarp(Player, 624, 7, 6)

If HasObj(Player, 392) >= 4 Then
	TakeObj(Player, 392, 4)
	GiveObj(Player, 444, 1)
	PlayerMessage(Player, "You trade 4 Game Tokens for some Fireworks!", White)
Else
	PlayerMessage(Player, "You require 4 Game Tokens for this.", White)
End If

End Sub