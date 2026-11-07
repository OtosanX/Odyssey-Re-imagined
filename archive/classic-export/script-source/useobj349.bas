Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 349 Then
		SetItemSuffix(Player, Slot, 255)
		SetItemPrefix(Player, Slot, 0)
	End If
Next Slot

Main = Continue

End Function