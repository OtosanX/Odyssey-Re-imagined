SUB Main(Player AS LONG)
if hasobj(player,436) then
takeobj(player,436,1)
giveobj(player,342,1)
playermessage(PLayer,"You drop your book but find a pair of boots",green)
else
playermessage(player,"You can't find anything in the pot",green)
end if
END SUB