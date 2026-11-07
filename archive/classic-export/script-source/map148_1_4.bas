Sub Main(Player as long)
if StrCmp(GetPlayerName(Player), "Gold") then
playermessage(player,"You are permitted onstage.",white)
else
if getplayeraccess(player) = 10 then
playermessage(player,"You are permitted onstage.",white)
else
playerwarp(player,getplayermap(player),getplayerx(player), getplayery(player) +1)
playermessage(player,"You are not allowed on stage!",brightred)
end if
end if
end sub