Sub Main(Player as Long)

PlayerWarp(Player, 624, 1, 4)

If HasObj(Player, 392) >= 7 Then
	TakeObj(Player, 392, 7)
	GiveObj(Player, 50, 1)
	PlayerMessage(Player, "You trade 7 Game Tokens for some King's Boots!", White)
Else
	PlayerMessage(Player, "You require 7 Game Tokens for this.", White)
End If

End Sub