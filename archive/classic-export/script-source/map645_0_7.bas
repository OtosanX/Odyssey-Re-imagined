Sub main(player as long)
dim a as long
setplayerflag(player,42,1)
for a = 0 to getmaxusers
if getplayeraccess(a) >=10 then
playermessage(a,strcat(getplayername(player)," has walked on or near the frost hammer."),white)
else
end if
next a
end sub