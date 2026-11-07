Sub Main(Player as Long)
dim Spawn as Long

If GetFlag(96) > 0 Then
	PlayerMessage(Player, "This room is in use.", Grey)
	PlayerWarp(Player, 1413, 1, 4)
Else
	OpenDoor(1413, 10, 9)
	PlayerWarp(Player, 1413, 1, 8)
	SetPlayerFlag(Player, 10, 10)
	SetPlayerFlag(Player, 11, 1)
	SetFlag(96, Player)
	Select Case GetPlayerFlag(Player, 216)
		Case 0
			Spawn = 1
		Case 1
			Spawn = 2
		Case 2
			Spawn = 3
		Case 3
			Spawn = 4
		Case 4
			Spawn = 4
	End Select

Select Case Random(Spawn) + 1
	Case 1
		SpawnMonster(1413, 190, 2, 9, 0)
	Case 2
		SpawnMonster(1413, 191, 2, 9, 0)
	Case 3
		SpawnMonster(1413, 192, 2, 9, 0)
	Case 4
		SpawnMonster(1413, 193, 2, 9, 0)
End Select
End If

End Sub