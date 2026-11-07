Sub Main(Player as Long)

PlayerWarp(Player, 624, 2, 6)

If HasObj(Player, 392) >= 2 Then
	TakeObj(Player, 392, 2)
	GiveObj(Player, 373, 1)
	PlayerMessage(Player, "You trade 2 Game Tokens for a Warlord's Tunic!", White)
Else
	PlayerMessage(Player, "You require 2 Game Tokens for this.", White)
End If

End Sub