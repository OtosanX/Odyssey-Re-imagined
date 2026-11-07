function main(player as long) as long

If getplayerflag(player,10) = 0 then
main = stop
exit function
end if

if getplayerflag(player,10) <=8 then
playermessage(player,"You need to plant the explosive somewhere else first!",white)
main = stop
exit function
end if

if getplayerflag(player,10) >=10 then
playermessage(player,"You already planted an explosive here!",white)
main = stop
exit function
end if

if getplayerflag(player,10) = 9 then
if hasobj(player,351) >0 then
takeobj(player,351,1)
playermessage(player,"You plant an explosive on the wall base. [7 Remaining]",white)
setplayerflag(player,10,10)
else
playermessage(player,"You need explosives!",white)
end if
end if

end function