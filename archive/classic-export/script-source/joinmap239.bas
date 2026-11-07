function main(player as long) as long
dim a as long

if getplayerflag(player,10) = 17 then
playermessage(player,"The ceiling falls behind you, it crushes any extra explosives you had, that was close! But the fuse is still lit, hurry to the well!",white)
for a = 1 to 100
takeobj(player,351,1)
takeobj(player,352,1)
next a
playerwarp(player,349,getplayerx(player),getplayery(player))
else
for a = 1 to 100
takeobj(player,351,1)
takeobj(player,352,1)
next a
main = stop
exit function
end if

end function