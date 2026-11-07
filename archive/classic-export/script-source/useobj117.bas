Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 117 Then 
		'SetItemPrefix(Player, Slot, 255)
		'SetEquippedItemSuffix(Player,2,255)
		SetItemSuffix(Player, Slot, 255)
	End If
Next Slot

Main = Continue

End Function