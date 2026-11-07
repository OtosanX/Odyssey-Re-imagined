Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 450 Then SetItemSuffix(Player, Slot, 101)
Next Slot

Main = Continue

End Function