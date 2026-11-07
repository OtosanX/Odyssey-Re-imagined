function main(player as long) as long

If getplayerflag(player,10) = 0 then
main = stop
exit function
end if

if getplayerflag(player,10) <=15 then
playermessage(player,"You need to plant the explosive somewhere else first!",white)
main = stop
exit function
end if

if getplayerflag(player,10) >=17 then
playermessage(player,"You already planted an explosive here!",white)
main = stop
exit function
end if

if getplayerflag(player,10) = 16 then
if hasobj(player,351) >0 then
takeobj(player,351,1)
playermessage(player,"You plant an explosive on the wall base and light the fuse. You have to escape the cave quickly! Get back to the well!",white)
setplayerflag(player,10,17)
else
playermessage(player,"You need explosives!",white)
end if
end if

end function