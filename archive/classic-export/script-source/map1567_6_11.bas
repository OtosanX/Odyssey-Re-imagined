Function main(player as long) as long
Dim a as long
a = random(2)
if hasobj(player,426) then
takeobj(player, 426, 1)
runscript0("spawnaeaml")
end if
select case a
case 0
playerwarp(player, 1561, 4, 8)
case 1
playerwarp(player, 1561, 8, 9)
case else
end select
main = continue
End Function