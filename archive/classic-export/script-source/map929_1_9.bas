Sub Main(Player as Long)

PlayerWarp(Player, 923, 5, 5)
SpawnObject(929, 208, 1, 1, 10)
If GetPlayerLevel(Player) < 70 Then
	GivePlayerExp(Player, 50000)
	PlayerMessage(Player, "You receive 50k experience for completing Abyss Quest!", White)
End If

End Sub