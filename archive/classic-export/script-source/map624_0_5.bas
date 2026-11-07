Sub Main(Player as Long)

PlayerWarp(Player, 624, 0, 6)

If HasObj(Player, 392) >= 1 Then
	TakeObj(Player, 392, 1)
	GiveObj(Player, 54, 1)
	PlayerMessage(Player, "You trade 1 Game Token for a Jester's Cap!", White)
Else
	PlayerMessage(Player, "You require 1 Game Token for this.", White)
End If

End Sub