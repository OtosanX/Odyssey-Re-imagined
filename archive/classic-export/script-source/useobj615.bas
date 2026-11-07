Function Main(Player as Long) AS LONG
dim Slot as Long

If GetPlayerClass(Player) = 3 Then
playermessage(player, "You embrace ancient powers originating from distant lands in the west.", grey)
For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 615 Then 
	SetItemsuffix(Player, Slot, 81)
	'SetItemprefix(Player, Slot, 255)
	'SetEquippedItemSuffix(Player,5,81)
	end if
Next Slot

Main = Continue

else
playermessage(player, "You are not a thief.", grey)
main = stop
end if
end function








