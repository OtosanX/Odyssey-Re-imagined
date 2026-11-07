Function Main(Player AS LONG) AS LONG
If Getplayerlevel(player) <74 then
playermessage(player,"You must be level 75 or above to equip this weapon.", white)
main=stop
else
Main=Continue
end if
end FUNCTION