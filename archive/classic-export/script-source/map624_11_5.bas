Sub Main(Player as Long)

PlayerWarp(Player, 624, 11, 6)

If HasObj(Player, 392) >= 6 Then
	TakeObj(Player, 392, 6)
	GiveObj(Player, 482, 1)
	PlayerMessage(Player, "You trade 6 Game Tokens for a Teddy!", White)
Else
	PlayerMessage(Player, "You require 6 Game Tokens for this.", White)
End If

End Sub