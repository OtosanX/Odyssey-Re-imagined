
Function main(player as long) as long
Dim a as long
a = random(4)
select case a
case 0
SpawnMonster(2117, 406, 5, 4)
case 1
SpawnMonster(2117, 406, 2, 7)
case 2
SpawnMonster(2117, 406, 7, 9)
case 3
SpawnMonster(2117, 406, 10, 6)
case else
end select
main = continue
End Function