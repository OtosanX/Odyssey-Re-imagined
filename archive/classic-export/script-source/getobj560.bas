FUNCTION Main(Player AS LONG) AS LONG
if getplayeraccess(player) >=1 then
main = continue
else
playerwarp(player,666,6,6)
globalmessage(strcat(getplayername(player), " has tried to caress a god item and was sent to hell!"),red)
takeobj(player, 506, 1)
If GetPlayerMap(Player) = 533 Then BanPlayer(Player, 99, "you hit the trap!")
main = stop
exit function
end if
END FUNCTION