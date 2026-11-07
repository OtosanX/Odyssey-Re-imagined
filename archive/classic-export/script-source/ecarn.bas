Sub Main(Player as Long)
if getplayermap(player) = 666 | getplayermap(player) = 301 | getplayermap(player) = 68 | GetPlayerFlag(Player, 10) = 1 then
playermessage(player,"You can not use carnage warp from jail, hell or waiting room!",yellow)
exit sub
end if
if getflag(84) = 1 then

Dim N as Long
   If GetPlayerLevel(Player) = 1 & GetPlayerExperience(Player) = 0 Then
      If GetPlayerClass(Player) = 1 Then
         For N = 1 to 510
            If HasObj(Player, N) Then
               PlayerMessage(Player, "You cannot bring anything into Equal Opportunity Carnage!", WHITE)
               Exit Sub
            End If
         Next N
         SetPlayerFlag(Player, 11, 1)
         PlayerMessage(Player, "Welcome to Equal Opportunity Carnage!", WHITE)
         PlayerWarp(Player, 92, 5, 5)
      Else
         PlayerMessage(Player, "You must be a Knight to enter Equal Opportunity Carnage!", WHITE)
      End If
   Else
      PlayerMessage(Player, "You must be level 1 to enter Equal Opportunity Carnage!", WHITE)
   End If

playermessage(player,"You have been instantly warped to the equal opportunity carnage!",yellow)
exit sub
else
playermessage(player,"Carnage warp has ended, sorry!",yellow)
exit sub

end if
End Sub