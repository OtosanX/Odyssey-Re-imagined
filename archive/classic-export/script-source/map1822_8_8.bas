SUB Main(Player AS LONG)
If HasObj(242,1) Then
playermessage(player,"You may pass.",white)
else
playerwarp(player,1822,8,7)
playermessage(player,"You cannot escape without the flame sabre!",white)
end if
END SUB