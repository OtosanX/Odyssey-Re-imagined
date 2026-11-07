Function main(player as long) as long
if getplayerguild(player) = 30 then
takeobj(player,508,1)
main = stop
exit function
end if

If getplayerguild(player) = 31 then
takeobj(player,509,1)
main = stop
exit function
end if
end function