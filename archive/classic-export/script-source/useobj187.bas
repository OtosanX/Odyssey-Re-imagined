Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 187 Then SetItemSuffix(Player, Slot, 102)
Next Slot

Main = Continue

End Function