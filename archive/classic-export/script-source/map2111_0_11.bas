SUB Main(Player AS LONG)
if hasobj(player, 600) then
takeobj(player, 600,1)
setflag (183,1)
spawnmonster(2111,403,6,4)
spawnmonster(2111,414,1,10)
globalmessage(strcat(getplayername(player), " and friends have summoned the legendary Fire Lord Lavos!"), BRIGHTRED)
end if
END SUB