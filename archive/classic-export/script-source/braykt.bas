function main(player as long) as long

if hasobj(player,365) then
if getplayerflag(player,50) = 60 then
main = stop
exit function
else
setplayerflag(player,50,getplayerflag(player,50) + 1)
timer(player,60,"braykt")
end if
end if

end function