Function Main(Player as Long) AS LONG
dim Slot as Long


If GetPlayerClass(Player) = 2 Then
playermessage(player, "You embrace ancient powers originating from distant lands in the west.", grey)
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 614 Then 
	SetItemSuffix(Player, slot, 80)
	'SetItemprefix(Player, slot, 255)
	'SetEquippedItemSuffix(Player,5,80)
	end if
Next Slot

Main = Continue

else
playermessage(player, "You are not a mage.", grey)
main = stop
end if
end function








