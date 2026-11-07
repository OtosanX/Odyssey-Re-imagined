
SUB Main(Player AS LONG)

If GetPlayerGuild(Player) > 0 Then	

if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
	playermessage(player, "You open a portal for your allies to enter.", grey)
	PlayerWarp(Player, 2114, 9, 1)
	OpenDoor(2114, 1, 6)
else
playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
PlayerWarp(Player, 2114, 9, 1)
end if

else
playermessage(player, "You are not in a guild.", white)
PlayerWarp(Player, 2114, 9, 1)

end if
end sub

