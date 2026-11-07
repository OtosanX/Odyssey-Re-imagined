Sub Main(Player as Long)
dim Map as Long, X as Long, Y as Long
Map = GetPlayerMap(Player)
X = GetPlayerX(Player)
Y = GetPlayerY(Player)

If GetPlayerDirection(Player) = Up Then
	If Map = 1795 Then
		If X = 5 | X = 6 Then
			If Y = 6 Then
				TakeObj(Player, 391, 1)
				Select Case Random(2)
					Case 0
						'GET KEY
						GiveObj(Player, 391, 1)
					Case 1
						'GET PRIZE
						GiveObj(Player, 6, 1)
						PlayerWarp(Player, 1793, 5, 5)
				End Select	
			End If
		End If
	End If
End If

End Sub