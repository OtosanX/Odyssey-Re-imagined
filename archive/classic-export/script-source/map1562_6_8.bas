Function main(player as long) as long
Dim a as long
a = random(4)
if hasobj(player,426) then
takeobj(player, 426, 1)
timer(player, 1, "spawnrahve")
end if
select case a
case 0
playerwarp(player, 1563, 8, 8)
case 1
playerwarp(player, 1563, 8, 4)
case 2
playerwarp(player, 1563, 4, 8)
case 3
playerwarp(player, 1563, 4, 4)
case else
end select
main = continue
End Function