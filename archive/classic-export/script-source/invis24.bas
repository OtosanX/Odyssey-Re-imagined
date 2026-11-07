function main(player as long) as long
If GetPlayerStatus(Player) = 9 Then
if Getplayerhp(player) = getplayermaxhp(player) & Getplayerenergy(player) = getplayermaxenergy(player) then

Timer(Player, 1, "Invis24")
else
runscript1("turnvisible24", player)
end if
end if
end function