SUB Main(Player AS LONG)
If HasObj(Player,164) Then
takeobj(player,164,1)
PlayerWarp(player,1610,6,11)
playermessage(player,"Your wish has come true.  The water cannot stop you.",white)
else
Playermessage(player,"You do not have a wish to wish!",white)
playerwarp(player,1610,6,8)
end if

END SUB