SUB Main(Player AS LONG)
if hasobj(player,419) then
if hasobj(player,454) then
playermessage(PLayer,"You drizzle magma over the frozen shut book",white)
playermessage(player,"Your book has been defrost",white)
takeobj(player,454,1)
takeobj(player,419,1)
giveobj(player,329,1)
else
playerwarp(player,594,1,6)
playermessage(player,"This table is reserved!",white)
end if
end if
END SUB