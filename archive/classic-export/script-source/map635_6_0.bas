Function main(player as long) as long
Dim a as long
a = random(4)
setflag(102, 1)
if hasobj(player,426) then
takeobj(player, 426, 1)
runscript0("spawnnymph1")
end if
select case a
case 0
playerwarp(player, 1560, 5, 9)
case 1
playerwarp(player, 1560, 2, 5)
case 2
playerwarp(player, 1560, 6, 2)
case 3
playerwarp(player, 1560, 9, 6)
case else
end select
main = continue
End Function