Function main(player as long) as long
Dim a as long, x as long, y as long, b as long

a = random(90) + 1
'mapmessage(getplayermap(player),str(a),white)

if getplayerdirection(player) = left then
x = getplayerx(player) - 1
y = getplayery(player)
else
if getplayerdirection(player) = right then
x = getplayerx(player) + 1
y = getplayery(player)
else
if getplayerdirection(player) = up then
x = getplayerx(player)
y = getplayery(player) - 1 
else
if getplayerdirection(player) = down then
x = getplayerx(player)
y = getplayery(player) + 1 
else
end if
end if
end if
end if

select case a

case 1
spawnobject(getplayermap(player),6,2000,x,y)

case 2
spawnobject(getplayermap(player),6,4000,x,y)

case 3
spawnobject(getplayermap(player),6,6000,x,y)

case 4
spawnobject(getplayermap(player),6,8000,x,y)

case 5
spawnobject(getplayermap(player),6,2000,x,y)

case 6
spawnobject(getplayermap(player),6,4000,x,y)

case 7
spawnobject(getplayermap(player),6,6000,x,y)

case 8
spawnobject(getplayermap(player),6,8000,x,y)

case 9
spawnobject(getplayermap(player),6,8000,x,y)

case 10
spawnobject(getplayermap(player),6,8000,x,y)

case 11
spawnobject(getplayermap(player),6,2000,x,y)

case 12
spawnobject(getplayermap(player),6,4000,x,y)

case 13
spawnobject(getplayermap(player),6,6000,x,y)

case 14
spawnobject(getplayermap(player),6,8000,x,y)

case 15
spawnobject(getplayermap(player),6,2000,x,y)

case 16
spawnobject(getplayermap(player),6,4000,x,y)

case 17
spawnobject(getplayermap(player),6,6000,x,y)

case 18
spawnobject(getplayermap(player),6,8000,x,y)
spawnobject(getplayermap(player),430,1,x,y)

case 19
spawnobject(getplayermap(player),6,8000,x,y)
spawnobject(getplayermap(player),430,1,x,y)

case 20
spawnobject(getplayermap(player),6,8000,x,y)
spawnobject(getplayermap(player),398,1,x,y)


case else


end select

main = continue
End Function