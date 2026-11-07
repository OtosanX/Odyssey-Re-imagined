Function Main(Player as Long) AS LONG
dim Slot as Long

For Slot = 1 To 20
'	If GetPlayerLevel(Player) >= 50 Then
'		If GetPlayerInvObject(Player, Slot) = 56 Then SetItemSuffix(Player, Slot, 254)
'	Else
		If GetPlayerInvObject(Player, Slot) = 56 Then SetItemSuffix(Player, Slot, 0)
'	End If
Next Slot

Main = Continue

End Function