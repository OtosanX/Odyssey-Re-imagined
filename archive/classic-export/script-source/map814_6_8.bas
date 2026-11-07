Sub Main(Player as Long)

PlayerWarp(Player, 803, 2, 2)
ResetMap(814)
If GetPlayerLevel(Player) < 30 Then
	GivePlayerExp(Player, 15000)
	PlayerMessage(Player, "You receive 15k experience for completing Garden Quest!", White)
End If

End Sub