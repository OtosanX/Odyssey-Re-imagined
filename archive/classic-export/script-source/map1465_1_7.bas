Function main(player as long) as long
Dim a as long
a = random(3)
setflag(104, 1)
if hasobj(player,468) then
takeobj(player, 468, 1)
SpawnMonster(1465, 253,7, 5,0)
end if
select case a
case 0
playerwarp(player, 1465, 6, 5)
case 1
playerwarp(player, 1465, 7, 9)
case 2
playerwarp(player, 1465, 2, 8)
case else
end select
main = continue
timer(player,3,"spawnwraith")
End Function