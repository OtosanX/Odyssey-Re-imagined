Sub Main(Player as Long)
dim Slot as Long, Suffix as Long

Select Case GetPlayerFlag(Player, 205)
	Case 0
		Suffix = 247 'attack
	Case 1
		Suffix = 246 'defense
	Case 2
		Suffix = 0
End Select

For Slot = 1 To 20
If GetPlayerInvObject(Player, Slot) = 59 Then SetItemSuffix(Player, Slot, Suffix)
'If GetPlayerInvObject(Player, Slot) = 609 Then SetItemSuffix(Player, slot, suffix)
Next Slot

If GetPlayerEquipped(Player, 5) = 59 Then SetEquippedItemSuffix(Player, 5, Suffix)
'If GetPlayerEquipped(Player, 5) = 609 Then SetEquippedItemSuffix(Player, slot, suffix)


End Sub