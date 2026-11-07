SUB Main(Player AS LONG)
if hasobj(player,337) then
playerwarp(player,295,7,2)
playermessage(PLayer,"You turn the key.",white)
takeobj(player,337,1)
else
playerwarp(player,295,7,2)
playermessage(player,"You unable to get pass!",white)
end if
END SUB