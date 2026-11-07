Function Main(Player as Long, X as Long, Y as Long) as Long

Select Case GetPlayerDirection(Player)
	Case Up
		Timer(X, 1, "DodgeballSpawn2")
	Case Down
		Timer(X, 1, "DodgeballSpawn3")
	Case Left
		Timer(Y, 1, "DodgeballSpawn4")
	Case Right
		Timer(Y, 1, "DodgeballSpawn5")
End Select

End Function
