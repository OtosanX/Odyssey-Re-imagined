Function main(player as long) as long
Dim a as long
if getflag(104) = 1 then
a = random(2)
Timer(Player, 3, "Spawnwraith")
select case a
case 0
SpawnMonster(1465, 37, 3, 8,0)
case 1
SpawnMonster(1465, 37, 7, 9,0)
case else
end select
end if

for a = 0 to getmaxusers()
if getplayermap(a) = 1465 then goto outs
next a
setflag(104,0)
outs:
main = continue

End Function