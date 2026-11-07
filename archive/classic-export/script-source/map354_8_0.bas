SUB Main(Player AS LONG)
if getplayerhp(player) < getplayermaxhp(player) then
if getplayerenergy(player) < getplayermaxenergy(player) then
playerwarp(player,354,8,1)
playermessage(player,"You cannot enter the throne room without full hp and energy!",white)
end if
end if
END SUB