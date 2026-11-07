Sub Main(Player as Long)
dim Spawn as Long

If GetFlag(89) = 0 Then
	RunScript1("GameWarp", Player)
	PlayerMessage(Player, "Solo the Champ is closed.", Grey)
	Exit Sub
End If

If GetFlag(95) > 0 Then
	PlayerMessage(Player, "There is already someone soloing the Champ.", Grey)
	PlayerWarp(Player, 1829, 10, 1)
Else
	ResetMap(1829)
	PlayerWarp(Player, 1829, 5, 5)
	SetPlayerFlag(Player, 10, 8)
	SetFlag(95, Player)
	Select Case GetPlayerFlag(Player, 215)
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
		SpawnMonster(1829, 216, 6, 6, 0)
	Case 2
		SpawnMonster(1829, 144, 6, 6, 0)
	Case 3
		SpawnMonster(1829, 123, 6, 6, 0)
	Case 4
		SpawnMonster(1829, 114, 6, 6, 0)
End Select
End If

End Sub