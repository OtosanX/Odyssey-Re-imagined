Sub Main(Player as Long)

If GetPlayerLevel(Player) <= 20 Then PlayerWarp(Player, 1, 5, 5)
If GetPlayerLevel(Player) < 10 Then PlayerWarp(Player, 677, 2, 2)

SetPlayerFlag(Player, 15, 0)
RunScript1("Respawn", Player)
RunScript1("Sprite", Player)

Select Case GetPlayerFlag(Player, 30)
	Case 1 'House of PK
		PlayerWarp(Player, 1960, 2, 7)
		SetPlayerFlag(Player, 30, 0)
	Case 2 'Gallins House
		PlayerWarp(Player, 1887, 1, 6)
		SetPlayerFlag(Player, 30, 0)
End Select

End Sub