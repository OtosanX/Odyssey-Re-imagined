Sub Main(Player as Long)

PlayerWarp(Player, 97, 6, 10)
ResetMap(934)
If GetPlayerLevel(Player) < 30 Then
	GivePlayerExp(Player, 10000)
	PlayerMessage(Player, "You receive 10k experience for completing Norax Quest!", White)
End If

End Sub