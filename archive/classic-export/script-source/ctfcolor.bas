function main(player as long) as long

If GetPlayerMap(Player) = 124 | getplayermap(player) = 149 | getplayermap(player) = 150 Then
if hasobj(player,508) = 1 | hasobj(player,509) = 1 then
SetPlayerStatus(Player, 24)
      Main = Stop
      Exit Function
else
SetPlayerStatus(Player, 0)
      Main = continue
      Exit Function
end if
   End If

end function