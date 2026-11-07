Function main(player as long) as long

if GetPlayerEquipped(player, 1) = 379 then
if getplayerflag(player, 103) = 0 then
setplayerflag(player, 103, 1)
timer(player, 240, "overseer2")
setplayermana(player, getplayermana(player)+50)
     If GetPlayermana(Player) > GetPlayerMaxmana(Player) then
        SetPlayermana(Player, GetPlayerMaxmana(Player))
end if
else
playermessage(player, "You can't use this ability again yet!", grey)
end if
else
playermessage(player, "You can't use this ability!", grey)
end if


main = continue
End Function