SUB Main(Player AS LONG)
if hasobj(player,246) then
playerwarp(player,1826,5,3)
playermessage(PLayer,"You may pass.",white)
takeobj(player,246,1)
else
playerwarp(player,1826,6,5)
playermessage(player,"You do not have the key for passage!",white)
end if
END SUB