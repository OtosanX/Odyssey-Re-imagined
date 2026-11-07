Function main(player as long) as long
'Dim a as long
'a = random(4)
MapMessage(1567, "Round One: 4 Lava Nymphs", brightred)
Timer(Player, 30, "roundtwo")
'select case a
'case 0
SpawnMonster(1567, 226, 5, 3,0)
'case 1
SpawnMonster(1567, 226, 8, 3,0)
'case 2
SpawnMonster(1567, 226, 8, 6,0)
'case 3
SpawnMonster(1567, 226, 5, 6,0)
'case else
'end select
main = continue
End Function