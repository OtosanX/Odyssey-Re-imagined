Function Main(Player as Long) AS LONG
dim Slot as Long


If GetPlayerClass(Player) = 1 Then
	playermessage(player, "You embrace ancient powers originating from distant lands in the west.", grey)
	For Slot = 1 To 20
	If GetPlayerInvObject(Player, Slot) = 609 Then 
	SetItemsuffix(Player, Slot, 83)
	'SetItemprefix(Player, Slot, 255)
	'SetEquippedItemsuffix(Player, 5, 83)
	'SetEquippedItemPrefix(Player, 5, 175)
	end if
	Next Slot
	Main = Continue

else
playermessage(player, "You are not a knight.", grey)
main = stop
end if
end function







