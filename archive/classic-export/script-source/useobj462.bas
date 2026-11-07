Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 462 Then
		SetItemPrefix(Player, Slot, 0)
		SetItemSuffix(Player, Slot, 111)
	End If
Next Slot

Main = Continue

End Function