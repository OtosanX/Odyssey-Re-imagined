function main(player as long) as long   
dim a as long, b as long, c as long, d as long

   GlobalMessage("Capture the Flag has started!", blue)
   GlobalMessage("Map: Team Fortress CTF", white)
   B = 0
   C = 0

setflag(62,0)
setflag(63,0)


'//========Teams=======//

for a = 1 to getmaxusers

If getplayermap(a)= 68 then
if getplayeraccess(a) = 0 then
b = random(1)

if b = 0 then

if c >= d then
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 30)
SetPlayerSprite(A, 102)
d = d + 1
else
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 31)
SetPlayerSprite(A, 95)
c = c + 1
end if

else

if c < d then
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 31)
SetPlayerSprite(A, 95)
c = c + 1
else
SetPlayerFlag(A, 5, GetPlayerGuild(A))
SetPlayerGuild(A, 30)
SetPlayerSprite(A, 102)
d = d + 1
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
 If GetPlayerGuild(A) = 30 Then PlayerWarp(A, 150, 1, 6)
 If GetPlayerGuild(A) = 31 Then PlayerWarp(A, 124, 10, 6)
 If GetPlayerAccess(A) > 5 Then PlayerWarp(A, 149, 5, 5)
end if
next a

'//=======Flags=======//
SpawnObject(150, 508, 1, 1, 6)
SpawnObject(124, 509, 1, 10, 6)

end function