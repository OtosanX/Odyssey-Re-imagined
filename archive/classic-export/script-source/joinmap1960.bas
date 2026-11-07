Function Main(Player as Long) AS LONG
dim Slot as Long

PlayerMessage(Player, "Referee Garlic says, ''Feel free to ask me about any arena by typing /duelhelp.", White)



For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 247 Then 
		'SetItemPrefix(Player, Slot, 255)
		'SetEquippedItemSuffix(Player,5,255)
		SetItemSuffix(Player, Slot, 255)
	End If
Next Slot

Main = Continue

End Function




