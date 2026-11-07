Sub main(player as long)

if hasobj(player,277) > =1 then
playermessage(player,"You use your ticket for the Crendale Portal.",white)
playerwarp(player,593,2,2)
takeobj(player,277,1)
else
playermessage(player,"You do not have a ticket!",white)
playerwarp(player,593,2,4)
end if

end sub