SUB Main(Player AS LONG)
if hasobj(player,344) then
playerwarp(player,594,0,2)
playermessage(PLayer,"You jump on the barrel.",white)
else
playerwarp(player,594,0,3)
playermessage(player,"You cannot go in the attic",white)
end if
END SUB