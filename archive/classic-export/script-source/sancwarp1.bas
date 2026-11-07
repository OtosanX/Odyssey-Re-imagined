Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	If GetPlayerFlag(Player, 8) = 1 Then
		If Map = 596 & X = 2 & Y = 3 Then
			CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
			Timer(Player, 1, "SancWarp1")
		End If
		Select Case GetPlayerFlag(Player, 7)
			Case 1
				If (Map = 1699 & X = 6 & Y = 6) Then
					CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
					Timer(Player, 1, "SancWarp1")
				End If
			Case 2
				If Map = 623 & X = 10 & Y = 3 Then
					CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
					Timer(Player, 1, "SancWarp1")
				End If
			Case 3
				If Map = 510 & X = 3 & Y = 5 Then
					CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
					Timer(Player, 1, "SancWarp1")
				End If
			Case 4
				If Map = 168 & X = 4 & Y = 9 Then
					CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
					Timer(Player, 1, "SancWarp1")
				End If
			Case 5
				If Map = 222 & X = 7 & Y = 7 Then
					CreateCharacterEffect(Map, Player, 2, 30, 8, 1, 0)
					Timer(Player, 1, "SancWarp1")
				End If
		End Select
	End If
End If

End Sub