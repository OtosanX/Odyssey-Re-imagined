Function main(player as long) as long
Dim a as long
a = random(2)
Timer(Player, 6, "SpawnSpider4")
select case a
case 0
SpawnMonster(1560, 232, 6, 5,0)
case 1
SpawnMonster(1560, 232, 5, 6,0)
case else
end select
main = continue
End Function