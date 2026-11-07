
Sub Main(Player as Long)
if getplayermap(player) = 2114 & GetPlayerX(Player) = 5 & GetPlayerY(Player) = 7 Then
'globalmessage(strcat(getplayername(player), " is attempting to unlock the Fort Gate."), grey)
playermessage(player, "test", yellow)
end if 
end sub 