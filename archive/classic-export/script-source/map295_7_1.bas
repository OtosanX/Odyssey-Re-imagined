SUB Main(Player AS LONG)
if hasobj(player,337) then
playerwarp(player,295,7,0)
playermessage(PLayer,"You turn the key in the small knob.",white)
takeobj(player,337,1)
else
playerwarp(player,295,7,2)
playermessage(player,"You do not have the key that fits this passage!",white)
end if
END SUB