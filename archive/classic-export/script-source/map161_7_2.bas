sub main(player as long)
'//Random Damage Carnage Script by Atrus
dim a as long
a = random(9)
if getplayerhp(player) > getplayermaxhp(player) + 1 then
else
if getplayerhp(player) < 5 then
else
if a = 1 then
setplayerhp(player, getplayerhp(player) - 5)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 2 then
setplayerhp(player, getplayerhp(player) - 5)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 3 then
setplayerhp(player, getplayerhp(player) - 10)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 4 then
setplayerhp(player, getplayerhp(player) - 10)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 5 then
setplayerhp(player, getplayerhp(player) - 15)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 6 then
setplayerhp(player, getplayerhp(player) - 20)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 7 then
setplayerhp(player, getplayerhp(player) - 5)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 8 then
setplayerhp(player, getplayerhp(player) - 10)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
else
if a = 9 then
setplayerhp(player, getplayerhp(player) - 5)
playermessage(player,"Ouch, you got sucked into the swamp!",brightred)
end if
end if
end if
end if
end if
end if
end if
end if
end if
end if
end if
end sub