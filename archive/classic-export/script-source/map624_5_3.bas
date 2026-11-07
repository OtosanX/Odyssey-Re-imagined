Sub Main(Player as Long)

PlayerWarp(Player, 624, 5, 4)

If HasObj(Player, 392) >= 9 Then
	TakeObj(Player, 392, 9)
	GiveObj(Player, 196, 1)
	PlayerMessage(Player, "You trade 9 Game Tokens for a Staff of Wardos!", White)
Else
	PlayerMessage(Player, "You require 9 Game Tokens for this.", White)
End If

End Sub