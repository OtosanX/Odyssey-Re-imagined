sub main(player as long)
If getplayerstatus(player) <> 1 then
playermessage(player, "You pass through the gateway, and your thoughts grow darker.",grey)
playerwarp(player, 1656, 6, 9)
else
playerwarp(player, 1651, 8, 4)
playermessage(player, "Only those of the purest minds may pass through this gateway.",grey)
end if
end sub