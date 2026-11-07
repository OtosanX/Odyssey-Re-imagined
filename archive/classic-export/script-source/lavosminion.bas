
Function main(player as long) as long
Dim a as long
a = random(4)
select case a
case 0
SpawnMonster(2111, 414, 0, 8)
case 1
SpawnMonster(2111, 414, 5, 5)
case 2
SpawnMonster(2111, 414, 7, 1)
case 3
SpawnMonster(2111, 414, 9, 3)
case else
end select
main = continue
End Function