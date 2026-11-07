SUB Main(Player AS LONG)
dim Chance as Long, Object as Long, X as Long, Y as Long

	If GetMapPlayerCount(2119) >= 2 Then
		playerwarp(player, 2118,10,4)
		playermessage(player, "Only one leader may enter this vault.", brightred)
	end if

if getflag(188) > 0 then
		playerwarp(player, 2118,10,4)
		playermessage(player, "Someone has recently entered. You must wait for the room to be restocked.", brightred)
	end if

if getmapplayercount(2119) = 1 then
setflag(188,1) 'TRIGGERS VAULT TIMER, Disable here if you want to warp in.



'Heroic Jewels
'Chance = 1
'RunScript3("RareDroptest", Player, Chance, Object)

playermessage(player, "Fort Merchant says, ''On this special occassion, our workers acquired a special artifact which appears to be infused with ancient energy from distant lands in the west. Perhaps you are able harness this power...''", grey)
timer(player, 360, "fortvault")

playermessage(player, "Fort Mechant says, ''Come on, don't get all nit-picky now. I need to get ready for the next gathering. I'll give you 5 minutes to leave.''", brightred)
end if 
END SUB



