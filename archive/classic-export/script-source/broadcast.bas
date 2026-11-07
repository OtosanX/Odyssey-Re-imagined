FUNCTION Main(Player AS LONG, Message AS STRING) AS LONG

if getflag(2) = 0 & getplayeraccess(player) = 0 then
playermessage(player,"Broadcast is currently disabled.",yellow)
main = stop
exit function
end if

If getplayerflag(player,2) = 1 & getplayeraccess(player) = 0 & getplayerflag(player, 73) = 0 then
playermessage(player,strcat("You may only broadcast every ",strcat(str(getflag(2))," seconds.")),yellow)
main = stop
exit function
end if

if getplayerflag(player,2) = 0 & getplayeraccess(player) = 0 then
setplayerflag(player,2,1)
timer(player, getflag(2), "globaltimer")
end if

if getplayermap(player) = 666 then
playermessage(player,"You can not broadcast in hell, loser.",brightred)
main = stop
exit function
end if

If GetPlayerMap(Player) = 681 Then
	PlayerWarp(Player, 1, 5, 5)
	PlayerMessage(Player, "Check out the Quest Guides on the web site for help.  Other players are also a great source of help.  Join us on the forums if you have any questions!", BRIGHTGREEN)
	PlayerMessage(Player, "Don't forget to type /rules and read the laws of the land, otherwise you may be punished!", BrightGreen)
End if

If GetPlayerFlag(Player, 10) = 1 | GetPlayerFlag(Player, 11) = 1 Then
   If GetFlag(83) = 1 | GetFlag(84) = 1 Then
      Main = Continue
      Exit Function
   End If
End If

main = continue
END FUNCTION