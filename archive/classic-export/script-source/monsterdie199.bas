Function main(player as long) as long
Dim a as long, x as long, y as long

a = random(10) + 1
'mapmessage(getplayermap(player),str(a),white)
x = getplayerx(player)
y = getplayery(player)

if getplayerdirection(player) = left then x = x - 1
if getplayerdirection(player) = right then x = x + 1
if getplayerdirection(player) = up then y = y - 1
if getplayerdirection(player) = down then y = y + 1

select case a

case 1

spawnobject(getplayermap(player),53,1,x,y)

case 2

spawnobject(getplayermap(player),56,1,x,y)

case 3

spawnobject(getplayermap(player),6,4000,x,y)


case else


end select

main = continue
End Function