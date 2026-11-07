Function main(player as long) as long
Dim a as long, x as long, y as long

setflag(102, 0)

a = random(36) + 1
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
spawnobject(getplayermap(player),387,1,x,y)

case 2
spawnobject(getplayermap(player),382,1,x,y)

case 3
spawnobject(getplayermap(player),381,1,x,y)

case 4
spawnobject(getplayermap(player),380,1,x,y)

case 5
spawnobject(getplayermap(player),388,1,x,y)

case 6
spawnobject(getplayermap(player),387,1,x,y)

case 7
spawnobject(getplayermap(player),382,1,x,y)

case 8
spawnobject(getplayermap(player),381,1,x,y)

case 9
spawnobject(getplayermap(player),380,1,x,y)

case 10
spawnobject(getplayermap(player),388,1,x,y)

case 11
spawnobject(getplayermap(player),361,1,x,y)

case 12
spawnobject(getplayermap(player),363,1,x,y)

case else


end select

main = continue
End Function