SUB Main(Player AS LONG)
if getplayerhp(player) = getplayermaxhp(player) then
if getplayerenergy(player) = getplayermaxenergy(player) then
playerwarp(player,342,4,5)
else
playermessage(player,"You cannot enter the bank without full hp and energy!",white)
end if
else
playermessage(player,"You cannot enter the bank without full hp and energy!",white)
end if
END SUB