SUB Main(Player AS LONG)
if hasobj(player,267) then
playerwarp(player,1849,6,1)
playermessage(PLayer,"You slowly drop down with the rope.",white)
takeobj(player,267,1)
else
playerwarp(player,1203,7,5)
playermessage(player,"You need a rope!",white)
end if
END SUB