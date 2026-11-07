SUB Main(Player AS LONG)
if getplayerhp(player) = getplayermaxhp(player) then
if getplayerenergy(player) = getplayermaxenergy(player) then
playerwarp(player,1750,5,10)

else
playermessage(player,"You hear Yollh yell, don't come in before wiping your feet! ((Can't enter without full hp and energy))",white)
end if
else
playermessage(player,"You hear Yollh yell, don't come in before wiping your feet! ((Can't enter without full hp and energy))",white)
end if
END SUB