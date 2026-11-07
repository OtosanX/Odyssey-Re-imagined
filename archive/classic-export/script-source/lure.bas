Sub Main(Player as Long)
dim Map as Long, Mon as Long
Map = GetPlayerMap(Player)

CreatePlayerFloatText(Player, "Mon En!", BrightGreen)

Select Case GetPlayerDirection(Player)
	Case 0
		For Mon = 0 To 5
			If GetMonsterY(Map, Mon) <= GetPlayerY(Player) Then
				If Abs(GetPlayerX(Player) - GetMonsterX(Map, Mon)) < 4 Then
					SetMonsterTarget(Map, Mon, Player)
				End If
			End If
		Next Mon
	Case 1
		For Mon = 0 To 5
			If GetMonsterY(Map, Mon) >= GetPlayerY(Player) Then
				If Abs(GetPlayerX(Player) - GetMonsterX(Map, Mon)) < 4 Then
					SetMonsterTarget(Map, Mon, Player)
				End If
			End If
		Next Mon
	Case 2
		For Mon = 0 To 5
			If GetMonsterX(Map, Mon) <= GetPlayerX(Player) Then
				If Abs(GetPlayerY(Player) - GetMonsterY(Map, Mon)) < 4 Then
					SetMonsterTarget(Map, Mon, Player)
				End If
			End If
		Next Mon
	Case 3
		For Mon = 0 To 5
			If GetMonsterX(Map, Mon) >= GetPlayerX(Player) Then
				If Abs(GetPlayerY(Player) - GetMonsterY(Map, Mon)) < 4 Then
					SetMonsterTarget(Map, Mon, Player)
				End If
			End If
		Next Mon
End Select

End Sub