SUB Main(Player AS LONG)
if hasobj(player,278) then
playerwarp(player,1203,7,5)
playermessage(PLayer,"You lasso the rope around a stump and pull yourself up",white)
takeobj(player,278,1)
giveobj(player,309,1)
else
playerwarp(player,1846,7,6)
playermessage(player,"You need to find a rope!",white)
end if
END SUB