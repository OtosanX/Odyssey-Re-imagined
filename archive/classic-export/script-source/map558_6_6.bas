Sub main(player as long)

if getflag(11) = 0 then
playermessage(player, "To open this door, you must step on each orb in the correct order. Choose the wrong order, and you will be punished.",grey)
playermessage(player, "The 4 orbs begin to glow", white)
setflag(11,1)
playerwarp(player,559,getplayerx(player),getplayery(player))
else
playermessage(player, "To open this door, you must step on each orb in the correct order. Choose the wrong order, and you will be punished.",grey)
playermessage(player, "The 4 orbs begin to glow", white)
playerwarp(player,559,getplayerx(player),getplayery(player))
end if
end sub