Sub Main(Player as Long)

PlayerWarp(Player, 624, 3, 4)

If HasObj(Player, 392) >= 8 Then
	TakeObj(Player, 392, 8)
	GiveObj(Player, 306, 1)
	PlayerMessage(Player, "You trade 8 Game Tokens for a Glass Shield!", White)
Else
	PlayerMessage(Player, "You require 8 Game Tokens for this.", White)
End If

End Sub