Function main(player as long) as long
Dim a as long
a = random(4)
setflag(43, 1)
timer(player, 120, "aeamlheal")
GlobalMessage("Overlord Aeaml, the corrupted Paladin, has descended upon the challengers in his towers.", brightred)
spawnmonster(1561,114,3,7,0)
spawnmonster(1561,114,9,8,0)
select case a
case 0
SpawnMonster(1561, 221, 3, 2,0)

case 1
SpawnMonster(1561, 221, 10, 3,0)

case 2
SpawnMonster(1561, 221, 8, 5,0)

case 3
SpawnMonster(1561, 221, 4, 4,0)

case else
end select
main = continue
End Function