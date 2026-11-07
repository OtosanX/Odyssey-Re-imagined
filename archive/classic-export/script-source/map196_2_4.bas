Sub Main(Player as Long)
dim X as Long, Y as Long

SetPlayerFlag(Player, 210, 196)
Select Case GetPlayerDirection(Player)
	Case Up
		X = 2
		Y = 5
	Case Down
		X = 2
		Y = 3
	Case Left
		X = 3
		Y = 4
	Case Right
		X = 1
		Y = 4
End Select
SetPlayerFlag(Player, 211, X)
SetPlayerFlag(Player, 212, Y)
PlayerWarp(Player, 554, 10, 10)

End Sub