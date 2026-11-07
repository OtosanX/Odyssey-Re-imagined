function main(player as long) as long
dim a as long, b as long, c as long, d as long

globalmessage("A Random Team Carnage has started!",brightblue)
globalmessage("Map: Team City Carnage",white)

b = 0
c = 0
d = 0
setflag(60,0)
setflag(61,0)


'//========Teams=======//

for a = 1 to getmaxusers

If getplayermap(a)= 68 then
if getplayeraccess(a) = 0 then
b = random(1)

if b = 0 then

if c >= d then
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 30)
SetPlayerSprite(A, 51)
d = d + 1
setflag(61,getflag(61) + 1)
else
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 31)
SetPlayerSprite(A, 52)
c = c + 1
setflag(60,getflag(60) + 1)
end if

else

if c < d then
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 32)
SetPlayerSprite(A, 9)
c = c + 1
setflag(60,getflag(60) + 1)
else
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 33)
SetPlayerSprite(A, 51)
d = d + 1
setflag(61,getflag(61) + 1)
end if

end if
else
end if
else
end if

next a

'//========Warp=======//

for a = 1 to getmaxusers
if getplayermap(A) = 68 then
 If GetPlayerGuild(A) = 30 Then PlayerWarp(A, 667, 6, 6)
 If GetPlayerGuild(A) = 31 Then PlayerWarp(A, 649, 7, 4)
 If GetPlayerAccess(A) > 5 Then PlayerWarp(A, 667, 1, 1)
end if
next a

end function