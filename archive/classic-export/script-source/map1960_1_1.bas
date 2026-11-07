Sub Main(Player as Long)
dim X as Long, Y as Long

SetPlayerFlag(Player, 210, 1960)
Select Case GetPlayerDirection(Player)
	Case Up
		X = 1
		Y = 2
	Case Down
		X = 1
		Y = 0
	Case Left
		X = 2
		Y = 1
	Case Right
		X = 0
		Y = 1
End Select
SetPlayerFlag(Player, 211, X)
SetPlayerFlag(Player, 212, Y)
PlayerWarp(Player, 554, 10, 10)

End Sub