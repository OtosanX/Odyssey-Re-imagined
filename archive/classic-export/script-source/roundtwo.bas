Function main(player as long) as long
'Dim a as long
'a = random(4)
MapMessage(1567, "Round Two: 4 Lava Nymphs & 2 Burning Devils", brightred)
Timer(Player, 30, "roundthree")
'select case a
'case 0
SpawnMonster(1567, 226, 5, 3,0)
'case 1
SpawnMonster(1567, 226, 8, 3,0)
'case 2
SpawnMonster(1567, 226, 8, 6,0)
'case 3
SpawnMonster(1567, 226, 5, 6,0)


SpawnMonster(1567, 247, 8, 8,0)
SpawnMonster(1567, 247, 4, 4,0)
'case else
'end select
main = continue
End Function