FUNCTION Main(Player AS LONG) AS LONG
if getplayeraccess(player) = 0 then
	playerwarp(player,666,6,6)
	globalmessage(strcat(getplayername(player), " has tried to caress a god item and was sent to hell!"),red)
	takeobj(player, 506, 1)
	main = stop
	exit function
Else
	Main = Continue
end if

END FUNCTION