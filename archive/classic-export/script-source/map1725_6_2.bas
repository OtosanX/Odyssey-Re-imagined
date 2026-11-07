Sub Main(Player as Long)

PlayerWarp(Player, 97, 5, 9)
If GetPlayerLevel(Player) < 50 Then
	GivePlayerExp(Player, 30000)
	PlayerMessage(Player, "You receive 30k experience for completing Tower Quest!", White)
End If

End Sub