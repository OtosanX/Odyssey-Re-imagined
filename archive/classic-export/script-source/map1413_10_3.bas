Sub Main(Player as Long)
dim Spawn as Long

If GetFlag(97) > 0 Then
	PlayerMessage(Player, "This room is in use.", Grey)
	PlayerWarp(Player, 1413, 10, 4)
Else
	OpenDoor(1413, 10, 9)
	PlayerWarp(Player, 1413, 10, 9)
	SetPlayerFlag(Player, 10, 10)
	SetPlayerFlag(Player, 11, 2)
	SetFlag(97, Player)
	Select Case GetPlayerFlag(Player, 217)
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
		SpawnMonster(1413, 190, 9, 8, 0)
	Case 2
		SpawnMonster(1413, 191, 11, 8, 0)
	Case 3
		SpawnMonster(1413, 192, 9, 10, 0)
	Case 4
		SpawnMonster(1413, 193, 11, 10, 0)
End Select
End If

End Sub