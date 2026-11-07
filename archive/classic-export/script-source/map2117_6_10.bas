SUB Main(Player AS LONG)
if hasobj(player, 604) then
takeobj(player, 604,1)
setflag (189,1)
spawnmonster(2117,264,4,2)
spawnmonster(2117,406,7,2)


globalmessage(strcat(getplayername(player), " and his guildmates challenge the authority of Darkcone Fort!"), BRIGHTgreen)
end if
END SUB