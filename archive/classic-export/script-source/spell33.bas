Sub Main(Player as Long)
dim Map as Long, Mon as Long
Map = GetPlayerMap(Player)

If GetPlayerMap(Player) = 1828 | GetPlayerMap(Player) = 1829 Then
	PlayerMessage(Player, "You cant use that here.", Grey)
	Exit Sub
End If
If GetPlayerFlag(Player, 23) > 0 Then
	PlayerMessage(Player, "You must wait to use this ability again.", Grey)
	Exit Sub
End If
If GetTileAtt(Map, GetPlayerX(Player), GetPlayerY(Player)) = 11 Then
	PlayerMessage(Player, "You cant use that here.", Grey)
	Exit Sub
End If
'If HasObj(Player, 413) = 0 Then
'	PlayerMessage(Player, "You require a Holy Water to use this ability.", Grey)
'	Exit Sub
'End If

	SetPlayerFlag(Player, 23, 1)
	RunScript1("SpellCooldown", Player)
'	TakeObj(Player, 413, 1)

CreatePlayerFloatText(Player, "Mon En!", BrightGreen)
CreateCharacterEffect(Map, Player, 41, 40, 8, 0, 0)

Select Case GetPlayerDirection(Player)
	Case 0
		For Mon = 0 To 5
			If GetMonsterY(Map, Mon) <= GetPlayerY(Player) Then
				If Abs(GetPlayerX(Player) - GetMonsterX(Map, Mon)) < 4 Then
					If GetMonsterType(Map, Mon) <> 104 Then
						SetMonsterTarget(Map, Mon, Player)
					End If
				End If
			End If
		Next Mon
	Case 1
		For Mon = 0 To 5
			If GetMonsterY(Map, Mon) >= GetPlayerY(Player) Then
				If Abs(GetPlayerX(Player) - GetMonsterX(Map, Mon)) < 4 Then
					If GetMonsterType(Map, Mon) <> 104 Then
						SetMonsterTarget(Map, Mon, Player)
					End If
				End If
			End If
		Next Mon
	Case 2
		For Mon = 0 To 5
			If GetMonsterX(Map, Mon) <= GetPlayerX(Player) Then
				If Abs(GetPlayerY(Player) - GetMonsterY(Map, Mon)) < 4 Then
					If GetMonsterType(Map, Mon) <> 104 Then
						SetMonsterTarget(Map, Mon, Player)
					End If
				End If
			End If
		Next Mon
	Case 3
		For Mon = 0 To 5
			If GetMonsterX(Map, Mon) >= GetPlayerX(Player) Then
				If Abs(GetPlayerY(Player) - GetMonsterY(Map, Mon)) < 4 Then
					If GetMonsterType(Map, Mon) <> 104 Then
						SetMonsterTarget(Map, Mon, Player)
					End If
				End If
			End If
		Next Mon
End Select

End Sub