Function main(player as long) as long
dim a as long

for a = 0 to getmaxusers
if getplayermap(a) = 559 then
setflag(11,0)
playerwarp(a,558,getplayerx(player),getplayery(player))
else
end if
next a

End function