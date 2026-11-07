sub main(player as long)
dim x as long, y as long, a as long
if getmonstertarget(713,0) = player then
select case random(3)
case 0
select case random(4)
case 0
playermessage(player,"Nis tells you, ''Join me and I'll spare your life!",brightgreen)
case 1
playermessage(player,"Nis tells you, ''I could make you more powerful than you could ever dream!''",brightgreen)
case 2
mapmessage(713,"Nis yells, ''Your blood shall make a fine wine!''",grey)
case 3
mapmessage(713,strcat("Nis focuses on ",getplayername(player)),grey)
end select
playermessage(player,"You feel your life force being drained!", brightred)
CreateMapFloatText(713, getmonsterx(713,0),getmonstery(713,0), strcat("Vampirica ", getplayername(player)), brightred)
CreatePlayerFloatText(Player, "12", brightred)
if getplayerhp(player) > 12 then 
setplayerhp(player,getplayerhp(player)-12)
else
setplayerhp(player,1)
end if
CreateTileEffect(713,getplayerx(player),getplayerY(player), 2,20, 8, 0,0)
case 1
mapmessage(713,"Nis yells, ''Burn!",grey)
x = getmonsterx(713,0)
y = getmonstery(713,0)
CreateMapFloatText(713, x, y, "Incendia!", brightred)
select case getmonsterdirection(713,0)
case 0'up
CreateTileEffect(713,x,y-1, 23,20, 8, 0,0)
CreateTileEffect(713,x,y-2, 23,20, 8, 0,0)
CreateTileEffect(713,x,y-3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) = x & getplayery(a) < y & getplayery(a) >= y-3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

Case 1'down
CreateTileEffect(713,x,y+1, 23,20, 8, 0,0)
CreateTileEffect(713,x,y+2, 23,20, 8, 0,0)
CreateTileEffect(713,x,y+3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) = x & getplayery(a) > y & getplayery(a) <= y+3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

case 2'left
CreateTileEffect(713,x-1,y, 23,20, 8, 0,0)
CreateTileEffect(713,x-2,y, 23,20, 8, 0,0)
CreateTileEffect(713,x-3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) < x & getplayery(a) >= x-3 & getplayery(a) = y then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
case 3'right
CreateTileEffect(713,x+1,y, 23,20, 8, 0,0)
CreateTileEffect(713,x+2,y, 23,20, 8, 0,0)
CreateTileEffect(713,x+3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) > x & getplayery(a) <= x+3 & getplayery(a) = y then
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
mapmessage(713,strcat(strcat("Nis yells, ''You cant escape death forever, ",getplayername(player)),"!''"),grey)
case 1
mapmessage(713,strcat(strcat("Nis yells, ''Death is waiting for you, ",getplayername(player)),"!''"),grey)
end select

x = getmonsterx(713,0)
y = getmonstery(713,0)
CreateMapFloatText(713, x, y, "Incendia!", brightred)
select case getmonsterdirection(713,0)
case 0'up
CreateTileEffect(713,x,y-1, 23,20, 8, 0,0)
CreateTileEffect(713,x,y-2, 23,20, 8, 0,0)
CreateTileEffect(713,x,y-3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) = x & getplayery(a) < y & getplayery(a) >= y-3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

Case 1'down
CreateTileEffect(713,x,y+1, 23,20, 8, 0,0)
CreateTileEffect(713,x,y+2, 23,20, 8, 0,0)
CreateTileEffect(713,x,y+3, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) = x & getplayery(a) > y & getplayery(a) <= y+3 then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a

case 2'left
CreateTileEffect(713,x-1,y, 23,20, 8, 0,0)
CreateTileEffect(713,x-2,y, 23,20, 8, 0,0)
CreateTileEffect(713,x-3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) < x & getplayery(a) >= x-3 & getplayery(a) = y then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
case 3'right
CreateTileEffect(713,x+1,y, 23,20, 8, 0,0)
CreateTileEffect(713,x+2,y, 23,20, 8, 0,0)
CreateTileEffect(713,x+3,y, 23,20, 8, 0,0)
for a = 0 to getmaxusers
if getplayermap(a) = 713 & getplayerx(a) > x & getplayery(a) <= x+3 & getplayery(a) = y then
CreatePlayerFloatText(a, "10", brightred)
if getplayerhp(player) > 10 then 
setplayerhp(player,getplayerhp(player)-10)
else
setplayerhp(player,1)
end if
end if
next a
End select
end select
end if
if getplayermap(player) = 713 then timer(player,8,"nisfight")
end sub