
Function Main(Player as Long) AS LONG



If GetPlayerGuild(Player) > 0 Then	
if getplayerguild(player) = getflag(186) & getflag(185) > 0 then 
OpenDoor(2115, 0, 6)
playerwarp(player,2118,10,6)
playermessage(player, "You open the passage to allow your friend to enter.", white)


else
playermessage(player, "Your guild does not have special access to the Darkcone Fort.", white)
PlayerWarp(Player, 2118, 10, 6)
end if 

else
playermessage(player, "You are not in a guild.", white)
PlayerWarp(Player, 2118, 10, 6)
end if

end function

