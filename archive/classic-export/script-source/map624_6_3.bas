Sub Main(Player as Long)

PlayerWarp(Player, 624, 6, 4)

If HasObj(Player, 392) >= 10 Then
	TakeObj(Player, 392, 10)
	GiveObj(Player, 166, 1)
	PlayerMessage(Player, "You trade 10 Game Tokens for a Glass Stiletto!", White)
Else
	PlayerMessage(Player, "You require 10 Game Tokens for this.", White)
End If

End Sub