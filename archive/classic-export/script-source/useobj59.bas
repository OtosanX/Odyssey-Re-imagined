Function Main(Player as Long) AS LONG
dim Slot as Long, Suffix as Long

Select Case GetPlayerFlag(Player, 205)
	Case 0
		Suffix = 247
	Case 1
		Suffix = 246
	Case 2
		Suffix = 0
End Select

For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 59 Then SetItemSuffix(Player, Slot, Suffix)
Next Slot

Main = Continue

End Function