function main(player as long, message as string) as long

if getplayerflag(player,12) = 1 then
if instr(message,"window") then
playermessage(player,"Sleeping Man says, ''Amazing! You are indeed worthy of passing. Go on now, before I change my mind.''",grey)
opendoor(444,6,0)
setplayerflag(player,12,0)
main = stop
exit function
else
playermessage(player,"Sleeping Man says, ''Wrong! You have failed my test. Now get out of my house!''",grey)
playerwarp(player,444,3,4)
setplayerflag(player,12,0)
main = stop
exit function
end if
end if

if getplayerflag(player,12) = 0 then
if instr(message,"yes") then
playermessage(player,"Sleeping Man says, ''I am an ancient invention still used in some parts of the world today that allows people to see through walls. What am I?''",grey)
playermessage(player,"Please type the answer to the riddle.", brightblue)
setplayerflag(player,12,1)
main = stop
exit function
end if

if instr(message,"no") then
playermessage(player,"Sleeping Man says, ''Fine then!''",grey)
playermessage(player,"You are kicked out of the mans house!", white)
playerwarp(player,444,3,4)
setplayerflag(player,12,0)
main = stop
exit function
end if
end if

main = continue
end function