Function Main(Player as Long) AS LONG
dim Slot as Long

If GetPlayerClass(Player) = 4 Then
playermessage(player, "You embrace ancient powers originating from distant lands in the west.", grey)
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 617 Then 
		SetItemsuffix(Player, Slot, 82)
		'SetItemprefix(Player, Slot, 255)
		'SetEquippedItemSuffix(Player,5,82)
	end if
Next Slot

Main = Continue


else
playermessage(player, "You are not a cleric.", grey)
main = stop
end if
end function

