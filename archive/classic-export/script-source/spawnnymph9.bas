Function main(player as long) as long
Dim a as long
a = random(2)
Timer(Player, 6, "SpawnSpider1")
select case a
case 0
SpawnMonster(1560, 226, 6, 5,0)
case 1
SpawnMonster(1560, 226, 5, 6,0)
case else
end select
main = continue
End Function
