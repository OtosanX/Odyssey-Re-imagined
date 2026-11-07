function main(player as long) as long

if getplayeraccess(player) > 0 then
	main = continue
else
	playerwarp(player,666,6,6)
	globalmessage(strcat(getplayername(player), " has tried to use a god item and was sent to hell!"),red)
	takeobj(player, 506, 1)
	main = stop
	exit function
end if

end function