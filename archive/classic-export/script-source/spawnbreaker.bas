Function main(player as long) as long
Dim a as long
a = random(4)
GlobalMessage("Breaker Inferno, the Warlock, has descended upon the challengers in his sanctuary.", brightred)

select case a
case 0
SpawnMonster(1560, 223, 2, 5,0)
case 1
SpawnMonster(1560, 223, 5, 9,0)
case 2
SpawnMonster(1560, 223, 9, 6,0)
case 3
SpawnMonster(1560, 223, 6, 2,0)
case else
end select
main = continue
End Function