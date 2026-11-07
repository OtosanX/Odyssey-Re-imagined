function main(player as long) as long

If getplayerflag(player,10) = 0 then
main = stop
exit function
end if

if getplayerflag(player,10) >=2 then
playermessage(player,"You already planted an explosive here!",white)
main = stop
exit function
end if

if getplayerflag(player,10) = 1 then
if hasobj(player,351) >0 then
takeobj(player,351,1)
playermessage(player,"You plant an explosive on the wall base. [15 Remaining]",white)
setplayerflag(player,10,2)
else
playermessage(player,"You need explosives!",white)
end if
end if

end function