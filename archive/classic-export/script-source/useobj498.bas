Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 498 Then
		SetItemPrefix(Player, Slot, 0)
		SetItemSuffix(Player, Slot, 112)
	End If
Next Slot

Main = Continue

End Function