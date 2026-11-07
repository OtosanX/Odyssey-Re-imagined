Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 214 Then SetItemSuffix(Player, Slot, 104)
Next Slot

Main = Continue

End Function