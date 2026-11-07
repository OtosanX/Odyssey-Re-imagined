Sub Main(Player as Long)

PlayerWarp(Player, 624, 10, 4)

If HasObj(Player, 392) >= 12 Then
	TakeObj(Player, 392, 12)
	GiveObj(Player, 450, 1)
	PlayerMessage(Player, "You trade 12 Game Tokens for a Flamewave Sabre!", White)
Else
	PlayerMessage(Player, "You require 12 Game Tokens for this.", White)
End If

End Sub