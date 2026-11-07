Function main(player as long) as long
'Dim a as long
'a = random(4)
MapMessage(1567, "Round Four: 4 Burning Devils & 2 Hellkill Spiders", brightred)
Timer(Player, 45, "roundfive")
'select case a
'case 0
SpawnMonster(1567, 247, 5, 3,0)
'case 1
SpawnMonster(1567, 247, 8, 3,0)
'case 2
SpawnMonster(1567, 247, 8, 6,0)
'case 3
SpawnMonster(1567, 247, 5, 6,0)


SpawnMonster(1567, 232, 8, 8,0)
SpawnMonster(1567, 232, 4, 4,0)
'case else
'end select
main = continue
End Function