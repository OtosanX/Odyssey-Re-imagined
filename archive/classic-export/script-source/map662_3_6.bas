SUB Main(Player AS LONG)
if hasobj(player,330) then
takeobj(player,330,1)
giveobj(player,344,1)
playerwarp(player,662,4,6)
playermessage(PLayer,"This scroll... Possesses a lot of magical force, not even I could read most of it. However, I do know of a man more skilled than me. He is a Balt, you can find him in the West.",white)

else

end if
END SUB