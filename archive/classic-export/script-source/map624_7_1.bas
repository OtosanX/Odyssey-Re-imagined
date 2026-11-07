Sub Main(Player as Long)

PlayerWarp(Player, 624, 7, 2)

If HasObj(Player, 392) >= 14 Then
	TakeObj(Player, 392, 14)
	GiveObj(Player, 197, 1)
	PlayerMessage(Player, "You trade 14 Game Tokens for a Crown of Zeugg!", White)
Else
	PlayerMessage(Player, "You require 14 Game Tokens for this.", White)
End If

End Sub