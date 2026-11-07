Sub Main(Player as Long)

PlayerWarp(Player, 1, 5, 5)
ResetMap(427)
If GetPlayerLevel(Player) < 40 Then
	GivePlayerExp(Player, 20000)
	PlayerMessage(Player, "You receive 20k experience for completing Haunted House Quest!", White)
End If

End Sub