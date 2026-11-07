Function main(player as long) as long
Dim a as long
a = random(4)
if getflag(102) = 1 then
Timer(Player, 22, "SpawnColossus")
select case a
case 0
SpawnMonster(1560, 225, 2, 5,0)
case 1
SpawnMonster(1560, 225, 5, 9,0)
case 2
SpawnMonster(1560, 225, 9, 6,0)
case 3
SpawnMonster(1560, 225, 6, 2,0)
case else
end select
else
end if
main = continue
End Function