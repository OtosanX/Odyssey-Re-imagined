sub main(player as long)
dim x as long, y as long, a as long, target as long
if getmonstertarget(717,0) = player then
select case random(5)
case 0
select case random(4)
case 0
playermessage(player,"Nis tells you, ''Join me or parish!''",brightgreen)
case 1
playermessage(player,"Nis tells you, ''You stand no chance!''",brightgreen)
case 2
mapmessage(717,"Nis yells, ''Give me your soul!''",grey)
case 3
mapmessage(717,strcat("Nis points his finger at ",getplayername(player)),brightcyan)
end select
playermessage(player,"You feel your life force being drained!", brightred)
CreateMapFloatText(717, getmonsterx(717,0),getmonstery(717,0), strcat("Vampirica ", getplayername(player)), brightred)
CreatePlayerFloatText(Player, "12", brightred)
if getplayerhp(player) > 12 then 
setplayerhp(player,getplayerhp(player)-12)
else
setplayerhp(player,1)
end if
CreateTileEffect(717,getplayerx(player),getplayerY(player), 2,20, 8, 0,0)
case 1
mapmessage(717,"Nis yells, ''Feel the pain!",grey)
x = getmonsterx(717,0)
y = getmonstery(717,0)
CreateMapFloatText(717, x, y, "Incendia!", brightred)
select case getmonsterdirection(717,0)
case 0'up
CreateTileEffect(717,x,y-1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) < y & getplayery(a) >= y-3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

Case 1'down
CreateTileEffect(717,x,y+1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) > y & getplayery(a)  <= y+3 then 
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

case 2'left
CreateTileEffect(717,x-1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) < x & getplayerx(a) >= x-3 & getplayery(a) = y then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
case 3'right

CreateTileEffect(717,x+1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) > x & getplayerx(a) <= x+ 3 & getplayery(a) = y then 
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
End select
case 2

select case random(2)
Case 0
mapmessage(717,strcat(strcat("Nis yells, ''Your life ends here, ",getplayername(player)),"!''"),grey)
case 1
mapmessage(717,strcat(strcat("Nis yells, ''You cannot escape your fate, ",getplayername(player)),"!''"),grey)
end select

x = getmonsterx(717,0)
y = getmonstery(717,0)
CreateMapFloatText(717, x, y, "Incendia!", brightred)
select case getmonsterdirection(717,0)
case 0'up
CreateTileEffect(717,x,y-1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) < y & getplayery(a) >= y-3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

Case 1'down
CreateTileEffect(717,x,y+1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) > y & getplayery(a)  <= y+3 then 
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

case 2'left
CreateTileEffect(717,x-1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) < x & getplayerx(a) >= x-3 & getplayery(a) = y then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
case 3'right

CreateTileEffect(717,x+1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) > x & getplayerx(a) <= x+ 3 & getplayery(a) = y then 
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
End select

case 3
for a = 0 to getmaxusers()
if getplayermap(a) = 717 & random(2) = 0 then
setmonstertarget(717,0,a)
target = a
goto attack
end if
next a
goto next1
attack:
mapmessage(717,strcat(strcat("Nis yells, ''Time to die, ",getplayername(target)),"!''"),grey)
x = getmonsterx(717,0)
y = getmonstery(717,0)
CreateTileEffect(717,getplayerx(target),getplayery(target), 3,20, 8, 0,0)
select case getmonsterdirection(717,0)
case 0
playerwarp(target,717,x,y-1)
case 1
playerwarp(target,717,x,y+1)
case 2
playerwarp(target,717,x-1,y)
case 3
playerwarp(target,717,x+1,y)
end select
playermessage(target,"You are pulled to Nis!",brightred)
CreateTileEffect(717,getplayerx(target),getplayery(target), 3,20, 8, 0,0)
setmonstertarget(717,0,target)
next1:
case 4
mapmessage(717,"Nis yells, ''You cannot kill a god!",grey)
x = getmonsterx(717,0)
y = getmonstery(717,0)
CreateMapFloatText(717, x, y, "Incendia Ex!", brightred)


CreateTileEffect(717,x,y-1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y-3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) < y & getplayery(a) >= y-3 then
CreatePlayerFloatText(a, "14", brightred)
if getplayerhp(player) > 14 then 
setplayerhp(player,getplayerhp(player)-14)
else
setplayerhp(player,1)
end if
end if
next a


CreateTileEffect(717,x,y+1, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+2, 23,20, 8, 0,0)
CreateTileEffect(717,x,y+3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) = x & getplayery(a) > y & getplayery(a)  <= y + 3 then 
CreatePlayerFloatText(a, "14", brightred)
if getplayerhp(player) > 14 then
setplayerhp(player,getplayerhp(player)-14)
else
setplayerhp(player,1)
end if
end if
next a


CreateTileEffect(717,x-1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x-3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) < x & getplayerx(a) >= x-3 & getplayery(a) = y then
CreatePlayerFloatText(a, "14", brightred)
if getplayerhp(player) > 14 then 
setplayerhp(player,getplayerhp(player)-14)
else
setplayerhp(player,1)
end if
end if
next a

CreateTileEffect(717,x+1,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+2,y, 23,20, 8, 0,0)
CreateTileEffect(717,x+3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 717 & getplayerx(a) > x & getplayerx(a) <= x+ 3 & getplayery(a) = y then 
CreatePlayerFloatText(a, "14", brightred)
if getplayerhp(player) > 14 then
setplayerhp(player,getplayerhp(player)-14)
else
setplayerhp(player,1)
end if
end if
next a

end select
end if
if getplayermap(player) = 717 then timer(player,8,"nisfight2")
end sub