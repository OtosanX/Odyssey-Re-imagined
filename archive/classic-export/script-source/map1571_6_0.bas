Function main(player as long) as long
Dim a as long
a = random(7)
if hasobj(player,426) then
takeobj(player, 426, 1)
runscript0("spawnviex")
timer(player, 10, "viexesewarp")
end if
select case a
case 0
playerwarp(player, 1564, 4, 3)
case 1
playerwarp(player, 1564, 4, 6)
case 2
playerwarp(player, 1564, 7, 3)
case 3
playerwarp(player, 1564, 7, 6)
case 4
playerwarp(player, 1564, 6, 4)
case 5
playerwarp(player, 1564, 5, 5)
case 6
playerwarp(player, 1564, 5, 2)
case else
end select
main = continue
End Function