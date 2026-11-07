sub main(player as long)

if getplayerdirection(player) = left then
if getplayerlevel(player) >20 then
playermessage(player,"You may not use the bridge if you are above level 20.",white)
playerwarp(player,141,6,6)
else
playermessage(player,"Your newbie weight makes you walk over the makeshift bridge with ease.",white)
end if
end if

if getplayerdirection(player) = right then
if getplayerlevel(player) >20 then
playermessage(player,"You may not use the bridge if you are above level 20.",white)
playerwarp(player,141,4,6)
else
playermessage(player,"Your newbie weight makes you walk over the makeshift bridge with ease.",white)
end if
end if

if getplayerdirection(player) = up then
if getplayerlevel(player) >20 then
playermessage(player,"Exploits are not very nice, see you in hell.",brightred)
playerwarp(player,666,6,6)
end if
end if

if getplayerdirection(player) = down then
if getplayerlevel(player) >20 then
playermessage(player,"Exploits are not very nice, see you in hell.",brightred)
playerwarp(player,666,6,6)
end if
end if

end sub