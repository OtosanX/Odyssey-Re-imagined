Function main(player as long) as long
Dim a as long
a = random(4)

GlobalMessage("Flamelord Rahve, the fire elemental, has descended upon the challengers in his arena.", brightred)
mapmessage(1563, "Beware the Touch of Death who appears soon!", white)
spawnmonster(1563,164,6,6,0)
timer(player, 10, "Spawntod")
timer(player, 20, "todattack")
main = continue
End Function