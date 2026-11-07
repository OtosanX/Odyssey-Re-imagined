Sub Main(Player as Long)
dim K1 as Long, K2 as Long, K3 as Long, K4 as Long
dim Direction as Long

K1 = 1
K2 = 2
K3 = 3
K4 = 4

If GetPlayerFlag(Player, 110) > 0 Then
	If GetPlayerX(Player) < GetPlayerFlag(Player, 21) Then Direction = 1 'Left
	If GetPlayerX(Player) > GetPlayerFlag(Player, 21) Then Direction = 2 'Right
	If GetPlayerY(Player) < GetPlayerFlag(Player, 22) Then Direction = 3 'Up
	If GetPlayerY(Player) > GetPlayerFlag(Player, 22) Then Direction = 4 'Down

	If GetPlayerFlag(Player, 111) = 0 Then
		SetPlayerFlag(Player, 111, Direction)
	Else
		If GetPlayerFlag(Player, 112) = 0 Then
			SetPlayerFlag(Player, 112, Direction)
		Else
			If GetPlayerFlag(Player, 113) = 0 Then
				SetPlayerFlag(Player, 113, Direction)
			Else
				SetPlayerFlag(Player, 114, Direction)
				If GetPlayerFlag(Player, 111) = K1 Then
				If GetPlayerFlag(Player, 112) = K2 Then
				If GetPlayerFlag(Player, 113) = K3 Then
				If GetPlayerFlag(Player, 114) = K4 Then
				CreateMapFloatText(GetPlayerMap(Player), GetPlayerFlag(Player, 21), GetPlayerFlag(Player, 22), "Click!", BrightGreen)
				PlayerMessage(Player, "The plates click as they unlock!", White)
				SetPlayerFlag(Player, 110, 0)
					Select Case GetPlayerMap(Player)
						Case 90
							RunScript1("BossKeypad", Player)
					End Select
					Exit Sub
				End If
				End If
				End If
				End If
				'RESET
				SetPlayerFlag(Player, 110, 0)
				PlayerMessage(Player, "The plates click as they reset.", Grey)
			End If
		End If
	End If
End If

End Sub