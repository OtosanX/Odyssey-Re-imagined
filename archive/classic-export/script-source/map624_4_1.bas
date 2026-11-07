Sub Main(Player as Long)

PlayerWarp(Player, 624, 4, 2)

If HasObj(Player, 392) >= 13 Then
	TakeObj(Player, 392, 13)
	GiveObj(Player, 117, 1)
	PlayerMessage(Player, "You trade 13 Game Tokens for some Soulbinders!", White)
Else
	PlayerMessage(Player, "You require 13 Game Tokens for this.", White)
End If

End Sub