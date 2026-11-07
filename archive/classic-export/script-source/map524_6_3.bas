SUB Main(Player AS LONG)
if hasobj(player,338) then
takeobj(player,338,1)
playerwarp(player,524,6,3)
playermessage(PLayer,"You shatter your Diamond Pick, but you were able to crack it open.",white)
else
playerwarp(player,524,6,4)
playermessage(player,"You can't get by the rocks",white)
end if
END SUB