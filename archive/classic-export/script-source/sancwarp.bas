Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long

Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

SetPlayerFlag(Player, 8, 0)
If GetPlayerHP(Player) = GetPlayerMaxHP(Player) Then
	If Map = 596 & X = 2 & Y = 3 Then
		Select Case GetPlayerFlag(Player, 7)
			Case 1
				PlayerWarp(Player, 1699, 6, 6)
				CreateTileEffect(1699, 6, 6, 2, 60, 8, 0, 0)
			Case 2
				PlayerWarp(Player, 623, 10, 3)
				CreateTileEffect(623, 10, 3, 2, 60, 8, 0, 0)
			Case 3
				PlayerWarp(Player, 510, 3, 5)
				CreateTileEffect(510, 3, 5, 2, 60, 8, 0, 0)
			Case 4
				PlayerWarp(Player, 168, 4, 9)
				CreateTileEffect(168, 4, 9, 2, 60, 8, 0, 0)
			Case 5
				PlayerWarp(Player, 222, 7, 7)
				CreateTileEffect(222, 7, 7, 2, 60, 8, 0, 0)
		End Select
	End If
	Select Case GetPlayerFlag(Player, 7)
		Case 1
			If Map = 1699 & X = 6 & Y = 6 Then
				PlayerWarp(Player, 596, 2, 3)
				CreateTileEffect(596, 2, 3, 2, 60, 8, 0, 0)
			End If
		Case 2
			If Map = 623 & X = 10 & Y = 3 Then
				PlayerWarp(Player, 596, 2, 3)
				CreateTileEffect(596, 2, 3, 2, 60, 8, 0, 0)
			End If
		Case 3
			If Map = 510 & X = 3 & Y = 5 Then
				PlayerWarp(Player, 596, 2, 3)
				CreateTileEffect(596, 2, 3, 2, 60, 8, 0, 0)
			End If
		Case 4
			If Map = 168 & X = 4 & Y = 9 Then
				PlayerWarp(Player, 596, 2, 3)
				CreateTileEffect(596, 2, 3, 2, 60, 8, 0, 0)
			End If
		Case 5
			If Map = 222 & X = 7 & Y = 7 Then
				PlayerWarp(Player, 596, 2, 3)
				CreateTileEffect(596, 2, 3, 2, 60, 8, 0, 0)
			End If
	End Select
End If

End Sub