Function Main(player as long) as long

If getplayerguild(player) = 30 then
playerwarp(player,150,3,6)
setplayerhp(player,getplayermaxhp(player))
setplayerenergy(player,getplayermaxenergy(player))
setplayermana(player,getplayermaxmana(player))
main = stop
exit function
end if

If getplayerguild(player) = 31 then
playerwarp(player,124,8,6)
setplayerhp(player,getplayermaxhp(player))
setplayerenergy(player,getplayermaxenergy(player))
setplayermana(player,getplayermaxmana(player))
main = stop
exit function
end if

End Function