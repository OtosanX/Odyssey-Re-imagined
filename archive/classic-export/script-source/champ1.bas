Sub Main(Player as Long)
dim Spawn as Long

If GetFlag(89) = 0 Then
	RunScript1("GameWarp", Player)
	PlayerMessage(Player, "Solo the Champ is closed.", Grey)
	Exit Sub
End If
If GetFlag(90) > 0 Then
	PlayerMessage(Player, "There is already someone soloing the Champ.", Grey)
	PlayerWarp(Player, 1828, 10, 1)
Else
	ResetMap(1828)
	PlayerWarp(Player, 1828, 5, 5)
	SetPlayerFlag(Player, 10, 8)
	SetFlag(90, Player)
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
		SpawnMonster(1828, 216, 6, 6, 0)
	Case 2
		SpawnMonster(1828, 144, 6, 6, 0)
	Case 3
		SpawnMonster(1828, 123, 6, 6, 0)
	Case 4
		SpawnMonster(1828, 114, 6, 6, 0)
End Select
End If

End Sub