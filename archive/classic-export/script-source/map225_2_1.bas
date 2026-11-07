SUB Main(Player AS LONG)
if getplayerhp(player) < getplayermaxhp(player) then
if getplayerenergy(player) < getplayermaxenergy(player) then
playerwarp(player,225,2,2)
playermessage(player,"You cannot enter the inn without full hp and energy!",white)
end if
end if
END SUB