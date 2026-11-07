Function main(player as long) as long
Dim a as long, x as long, y as long
setflag(43, 2)
a = random(12) + 1
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


case else


end select

main = continue
End Function