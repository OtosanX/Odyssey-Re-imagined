Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 159 Then
		Select Case GetPlayerClass(Player)
			Case 2
				SetItemSuffix(Player, Slot, 113)
			Case 4
				SetItemSuffix(Player, Slot, 109)
			Case Else
				SetItemSuffix(Player, Slot, 0)
		End Select
	End If
Next Slot

Main = Continue

End Function