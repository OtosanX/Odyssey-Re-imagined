sub main(player as long)
if GETPLAYERGENDER(player) = 1 then
playermessage(player,"Females may use the stools, you sit gracefully.",white)
else
playermessage(player,"Men don't need stools, go stand on the hard rocks!",white)
playerwarp(player,446,3,8)
end if
end sub