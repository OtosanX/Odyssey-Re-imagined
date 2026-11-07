Sub Main(Player as Long)

If GetPlayerDirection(Player) = 1 Then
	PlayerWarp(Player, 1793, 6, 2)
	GiveObj(Player, 392, 1)
	PlayerMessage(Player, "You have refunded your Game Token.", White)
Else
	If HasObj(Player, 392) Then
		TakeObj(Player, 392, 1)
		PlayerWarp(Player, 1793, 6, 0)
		PlayerMessage(Player, "You put in a Game Token.", White)
	Else
		PlayerWarp(Player, 1793, 6, 2)
		PlayerMessage(Player, "You require a Game Token to play.", Grey)
	End If
End If

End Sub