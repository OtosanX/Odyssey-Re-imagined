Function main(player as long) as long
Dim a as long
a = random(2)
Timer(Player, 3, "Spawnwraith5")
select case a
case 0
SpawnMonster(1465, 37, 3, 8,0)
case 1
SpawnMonster(1465, 37, 7, 9,0)
case else
end select
main = continue
End Function