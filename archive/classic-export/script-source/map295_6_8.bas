Sub Main(Player as Long)

PlayerWarp(Player, 97, 8, 9)
ResetMap(295)
If GetPlayerLevel(Player) < 60 Then
	GivePlayerExp(Player, 40000)
	PlayerMessage(Player, "You receive 40k experience for completing Pyramid Quest!", White)
End If

End Sub