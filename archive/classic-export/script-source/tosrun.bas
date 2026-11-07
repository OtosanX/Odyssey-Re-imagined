Sub Main(Player as Long)
Dim Z as Long, Y as Long, F as Long
if getplayermap(player) = 666 | getplayermap(player) = 301 | getplayermap(player) = 68 | GetPlayerFlag(Player, 10) = 1 then
   playermessage(player,"You can not use tos warp from jail, hell or waiting room!",yellow)
   Exit Sub
end if

playerwarp(player,722,6,10)

End Sub