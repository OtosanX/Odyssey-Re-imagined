Function main(player as long) as long
Dim a as long
a = random(2)

if getflag(102) = 1 then
Timer(Player, 8, "SpawnDevil")
select case a
case 0
SpawnMonster(1560, 247, 6, 5,0)
case 1
SpawnMonster(1560, 247, 5, 6,0)
case else
end select
else
end if
main = continue
End Function