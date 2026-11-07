sub main(player as long)
dim b as long, dmg as long, map as long, x as long, y as long, players as long, a as long, damage as long, check as long, speed as long, totalframes as long, loopcount as long, sprite as long, i as long


if GetPlayerMana(Player) >= 34 then
   PlayCustomWav(Player, 0)
   SetPlayerMana(Player, GetPlayerMana(Player) - 34)
   PlayerMessage(Player, "You cast Frost Wave.", grey)
   map = getplayermap(player)
   dmg= 30
x = getplayerx(player)
y = getplayery(player)
sprite = 51
speed = 1
totalframes = 3
loopcount = 0
totalframes = 7
x = getplayerx(player)
y = getplayery(player)
for i = 0 to 4
if GetTileAtt(getplayermap(player), x, y)=0 | GetTileAtt(getplayermap(player), x, y)=10 then
if getplayerdirection(player)=0 then y = y - 1
if getplayerdirection(player)=1 then y = y + 1
if getplayerdirection(player)=2 then x = x - 1
if getplayerdirection(player)=3 then x = x + 1
For B = 0 to 7
if CanAttackMonster(player,b) then
if getmonsterx(map,b)= x then
if getmonstery(map,b)=y then
AttackMonster(player,b,dmg)
end if
end if
end if
next B
end if
for players = 0 to getmaxusers
if getplayermap(players)=map then
if getplayerx(players)=x then 
if getplayery(players)=y then
if player <> players then

AttackPlayer(Player,players,dmg) 
end if
end if
end if
end if
next players
outss:
next i
map = getplayermap(player)
x = getplayerx(player)
y = getplayery(player)
for i = 0 to 5
if GetTileAtt(getplayermap(player), x, y) = 0 & GetTileAtt(getplayermap(player), x, y) = 10 then
CreateTileEffect(Map, X, Y, 1, 1, 8, LoopCount, 0)
goto outs
end if
if x=13 then
CreateTileEffect(Map, X-1, Y, 1, 1, 8, LoopCount, 0)
goto outs
end if
if y=13 then
CreateTileEffect(Map, X, Y-1, 1, 1, 8, LoopCount, 0)
goto outs
end if
if x=-1 then
CreateTileEffect(Map, X+1, Y, 1, 1, 8, LoopCount, 0)
goto outs
end if
if y=-1 then
CreateTileEffect(Map, X, Y+1, 1, 1, 8, LoopCount, 0)
goto outs
end if
CreateTileEffect(map,x,y, sprite, speed,8,loopcount,0)
if getplayerdirection(player)=0 then y = y - 1
if getplayerdirection(player)=1 then y = y + 1
if getplayerdirection(player)=2 then x = x - 1
if getplayerdirection(player)=3 then x = x + 1
next i
outs:
     else
        PlayerMessage(Player, "You have insufficient mana to cast this spell.", grey)
     END IF
end sub