Sub Main(Player as Long)

PlayerWarp(Player, 624, 8, 4)

If HasObj(Player, 392) >= 11 Then
	TakeObj(Player, 392, 11)
	GiveObj(Player, 135, 1)
	PlayerMessage(Player, "You trade 11 Game Tokens for an Excalibur!", White)
Else
	PlayerMessage(Player, "You require 11 Game Tokens for this.", White)
End If

End Sub