Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 608 Then SetItemprefix(Player, Slot, 100)
Next Slot

Main = Continue

End Function